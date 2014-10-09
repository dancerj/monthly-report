FILENAME=debian_flyer
PAPERSIZE=a4
PDFQUALITY=prepress

all: clean build

build:
	inkscape --without-gui --vacuum-defs --export-area-page --export-dpi=300 --export-pdf=$(FILENAME).pdf --file=$(FILENAME).svg

# PDF/X-3 
# inkscape --without-gui --vacuum-defs --export-area-page --export-dpi=300 --export-eps=$(FILENAME).eps --file=$(FILENAME).svg
# gs \
# -sDEVICE=pdfwrite -dPDFX -sProcessColorModel=DeviceCMYK -dUseCIEColor -sColorConversionStrategy=CMYK \
# -dPDFSETTINGS=/$(PDFQUALITY) -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$(FILENAME).pdf $(FILENAME).eps

clean:
	rm -f *.eps *.pdf
