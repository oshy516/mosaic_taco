PAPER = mosaic
TEX = $(wildcard *.tex)
BIB = references.bib
FIGS = $(wildcard figures/*.pdf figures/*.png graphs/*.pdf graphs/*.png)
# SWEEP_SUMMARY = ../../PolyBench-NN/sweep/sweep_summary.csv
SWEEP_DATA = bounded_sweep_data.dat

.PHONY: all clean

all: $(PAPER)

# $(SWEEP_DATA): generate_bounded_sweep_data.py $(SWEEP_SUMMARY)
# 	python3 generate_bounded_sweep_data.py --input $(SWEEP_SUMMARY) --output $(SWEEP_DATA)

$(PAPER): $(TEX) $(BIB) $(FIGS) $(SWEEP_DATA) acmart.cls
	echo $(FIGS)
	pdflatex $(PAPER)
	bibtex $(PAPER)
	pdflatex $(PAPER)
	pdflatex $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.brf *.btx *.fdb_latexmk *.fls *.log *.out *.synctex.gz comment.cut *.synctex.gz $(PAPER).pdf
