all: enquete_summary.csv

enquete_summary.csv: enquete.csv ./getenquete.R
	./getenquete.R > enquete_summary.csv

.PHONY: all
