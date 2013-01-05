all: enquete_summary.csv

enquete_summary.csv: enquete.csv ./getenquete.R
	./getenquete.R > enquete_summary.csv

enquete_boxplot.eps: enquete.csv ./plotgraphs.R
	./plotgraphs.R

.PHONY: all
