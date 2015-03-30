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
	- list any cited resources in `literature.bib`
- run `make`

## Credits

The author of the TeX files is Martin Mareš (original can be downloaded from 
[his website](http://mj.ucw.cz/vyuka/bc/). I split `thesis.tex` into `start.tex` 
and `end.tex` to enable inserting pandoc-converted chapters. I also moved data 
about the thesis to `metadata.tex` and set up BibTeX (and thus removed 
`bibliography.tex`).

## License

The contents of this repository are derived from the templates by Martin Mareš
and follow the same license (anyone is free to use, share and modify it, as 
stated in the original readme).
