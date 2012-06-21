PAPERSIZE:=a4
PDFQUALITY:=prepress

.SUFFIXES: .svg .tmp .pdf
.svg.tmp:
	inkscape -z --vacuum-defs --export-dpi=300 --export-area-page --export-text-to-path --export-pdf=$@ --file=$<

.tmp.pdf:
	gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/$(PDFQUALITY) -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ $<

SVG=$(wildcard *.svg)
PDFTMP=$(SVG:.svg=.tmp)
PDF=$(PDFTMP:.tmp=.pdf)

all:	$(PDF)

clean:
	rm -f $(PDF) $(PDFTMP)
