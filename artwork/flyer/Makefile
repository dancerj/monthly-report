SVG_FILENAME=$(wildcard debian_flyer*.svg)
PDF_FILENAME=$(SVG_FILENAME:%.svg=%.pdf)
PAPERSIZE=a4
PDFQUALITY=prepress

.PHONY: all clean

all: $(PDF_FILENAME)

%.pdf: %.svg
	inkscape --vacuum-defs --export-area-page --export-dpi=300 --export-type=pdf $<

# PDF/X-3 
# inkscape --without-gui --vacuum-defs --export-area-page --export-dpi=300 --export-eps=$(FILENAME).eps --file=$(FILENAME).svg
# gs \
# -sDEVICE=pdfwrite -dPDFX -sProcessColorModel=DeviceCMYK -dUseCIEColor -sColorConversionStrategy=CMYK \
# -dPDFSETTINGS=/$(PDFQUALITY) -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(FILENAME).pdf $(FILENAME).eps

clean:
	rm -f *.eps *.pdf
