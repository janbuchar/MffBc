NAME = thesis
CHAPTERS_DIR = chapters
CHAPTER_FILES = $(wildcard $(CHAPTERS_DIR)/*.tex $(CHAPTERS_DIR)/*.md)
CHAPTERS = $(sort $(notdir $(basename $(CHAPTER_FILES))))

BUILD_DIR = build
BIB = literature.bib

CHAPTERS_TEX = $(CHAPTERS:%=$(BUILD_DIR)/%.tex)
COMBINED_TEX = $(BUILD_DIR)/$(NAME).combined.tex
PDFL_FLAGS = -jobname $(NAME)

all: $(NAME).pdf

# LaTeX must be run twice to get references right
$(NAME).pdf: $(COMBINED_TEX) $(NAME).bbl
	pdflatex $(PDFL_FLAGS) $<
	pdflatex $(PDFL_FLAGS) $<

$(COMBINED_TEX): $(BUILD_DIR) $(CHAPTERS_TEX) $(wildcard *.tex)
	cat start.tex > $@
	cat $(CHAPTERS_TEX) >> $@
	cat end.tex >> $@
	echo '\end{document}' >> $@

$(BUILD_DIR):
	mkdir -p "$@"

$(BUILD_DIR)/%.tex: $(CHAPTERS_DIR)/%.tex
	cp $< $@

$(BUILD_DIR)/%.tex: $(CHAPTERS_DIR)/%.md
	pandoc --chapters --natbib --biblio $(BIB) -o $@ $<

$(NAME).bbl: $(BIB) $(COMBINED_TEX)
	rm -f $(NAME).bbl
	pdflatex $(PDFL_FLAGS) $(COMBINED_TEX)
	bibtex $(NAME)

clean:
	- rm -rf $(BUILD_DIR)
	- rm -f *.log *.dvi *.aux *.toc *.lof *.lot *.out
	- rm -f $(NAME).pdf
	- rm -f $(NAME).bbl $(NAME).blg
