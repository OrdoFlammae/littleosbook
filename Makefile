BUILD_DIR = public

CSS = book.css
HTML_TEMPLATE = template.html
TEX_HEADER = header.tex
CHAPTERS = title.txt introduction.md environment_and_booting.md \
			 getting_to_c.md output.md segmentation.md interrupts.md \
			 the_road_to_user_mode.md virtual_memory.md \
			 paging.md page_frame_allocation.md user_mode.md file_systems.md \
			 syscalls.md scheduling.md \
			 references.md
BIB = bibliography.bib
CITATION = citation_style.csl

.PHONY: all release

all: $(BUILD_DIR)/index.html $(BUILD_DIR)/book.pdf $(BUILD_DIR)/book.epub

$(BUILD_DIR)/book.epub: $(CHAPTERS) $(BUILD_DIR)/$(CSS) $(TEX_HEADER) $(BIB) $(CITATION)
	pandoc -s -f markdown+smart --toc --toc-depth=2 -H $(TEX_HEADER) --top-level-division=chapter \
			 --epub-cover-image=public/images/cover.jpg --css=$(BUILD_DIR)/$(CSS) \
			 --bibliography $(BIB) --csl $(CITATION) \
			 $(CHAPTERS) -o $@

$(BUILD_DIR)/index.html: $(CHAPTERS) $(BUILD_DIR)/$(CSS) $(HTML_TEMPLATE) $(BIB) $(CITATION)
	pandoc -s -f markdown+smart -t html --toc -c $(CSS) --template $(HTML_TEMPLATE) \
			 --bibliography $(BIB) --csl $(CITATION) --number-sections \
			 $(CHAPTERS) -o $@

$(BUILD_DIR)/book.pdf: $(CHAPTERS) $(TEX_HEADER) $(BIB) $(CITATION)
	pandoc --toc -H $(TEX_HEADER) --pdf-engine=pdflatex --top-level-division=chapter \
			 --no-highlight --bibliography $(BIB) --csl $(CITATION) \
			 $(CHAPTERS) -o $@

clean:
	rm -f $(BUILD_DIR)/index.html $(BUILD_DIR)/book.pdf $(BUILD_DIR)/book.epub
