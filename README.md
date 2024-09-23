# littleosbook

This is the source code for the book ["The little book about OS development (OrdoFlammae's Fork)"](https://ordoflammae.github.io/littleosbook/).
The source for the book is written in
["Pandoc"](http://pandoc.org) Markdown.

This is a fork by `OrdoFlammae` to keep the book maintained, as the original version needed a number of fixes to keep it up to date. The goal is to expand the material to fit newer innovations in the field of OS development, without abandoning the original spirit of the material.

## Dependencies
If you want to use the build scripts (which we recommend you to do), you need
["Make"](http://www.gnu.org/software/make/).

To convert the Markdown to either HTML or PDF, you need to have
["Pandoc"](http://pandoc.org) version 1.9.1.1 or higher. For
installing Pandoc, see <http://pandoc.org/installing.html>.

If you want to create the PDF version, you also need `pdflatex` installed.

### Ubuntu

For Ubuntu, the following command can be executed to install all dependencies:

```bash
sudo apt-get install -y pandoc pandoc-citeproc texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-fonts-extra
```

## Building

The entire system can be built via

```bash
make all
```

The resulting files can be found in the `public` directory.

## Errors
If you find any error (there are probably plenty :)), please open a new
["issue"](https://github.com/OrdoFlammae/littleosbook-src/issues).

## Contributing
If you want to contribute new material or fix some errors, please open fork the
repository, make your changes and open a pull request.

## License
All content is licensed under the Creative Commons Attribute, NonCommercial,
Share-Alike license. See <http://creativecommons.org/licenses/by-nc-sa/3.0/us/>
for more details.
