PAPER = mosaic
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)

.PHONY: all clean

all: $(PAPER)

$(PAPER): $(TEX) $(BIB) $(FIGS) 
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.brf *.btx *.fdb_latexmk *.fls *.log *.out *.synctex.gz comment.cut *.synctex.gz $(PAPER).pdf
