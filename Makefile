SOURCE:=$(wildcard *.tex)
DVIFILES:=$(SOURCE:%.tex=%.dvi)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
all: $(PDFFILES)

%.pdf: %.dvi
	dvipdfmx $< 

%.dvi: %.tex
	platex $<
	platex $<
	platex $<

clean:
	-rm *.dvi *.aux *.toc *~ *.log *.waux
