# Bachelor's thesis sandbox

This repository contains a couple of template files (by Martin Mareš) for 
Bachelor theses at the Faculty of Mathematics and Physics, Charles University. 
Because writing long text sections in LaTeX can be cumbersome, the Makefile 
allows using Markdown.

## Usage

- install pandoc, pandoc-citeproc, pdflatex, bibtex
- write your thesis
	- fill in information about the thesis in `metadata.tex`
	- put new chapters in the `chapters` directory
	- list the chapters in the `CHAPTERS` variable in the Makefile
	- list any cited resources in `literature.bib`
- run `make`
