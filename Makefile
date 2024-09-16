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

all: book.html book.pdf book.epub

book.epub: $(CHAPTERS) $(CSS) $(TEX_HEADER) $(BIB) $(CITATION)
	pandoc -s -f markdown+smart --toc --toc-depth=2 -H $(TEX_HEADER) --top-level-division=chapter \
			 --epub-cover-image=images/cover.jpg --css=$(CSS) \
			 --bibliography $(BIB) --csl $(CITATION) \
			 $(CHAPTERS) -o $@

book.html: $(CHAPTERS) $(CSS) $(HTML_TEMPLATE) $(BIB) $(CITATION)
	pandoc -s -f markdown+smart -t html --toc -c $(CSS) --template $(HTML_TEMPLATE) \
			 --bibliography $(BIB) --csl $(CITATION) --number-sections \
			 $(CHAPTERS) -o $@

book.pdf: $(CHAPTERS) $(TEX_HEADER) $(BIB) $(CITATION)
	pandoc --toc -H $(TEX_HEADER) --pdf-engine=pdflatex --top-level-division=chapter \
			 --no-highlight --bibliography $(BIB) --csl $(CITATION) \
			 $(CHAPTERS) -o $@

ff: book.html
	firefox book.html

release: book.html book.pdf book.epub
	mkdir -p ../littleosbook/images
	cp images/*.png ../littleosbook/images/
	cp book.epub ../littleosbook/
	cp book.pdf ../littleosbook/
	cp book.html ../littleosbook/index.html
	cp book.css ../littleosbook/

clean:
	rm -f book.pdf book.html book.epub
