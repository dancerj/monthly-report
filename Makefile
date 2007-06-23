SOURCE:=$(wildcard debianmeeting*.tex)
DVIFILES:=$(SOURCE:%.tex=%.dvi)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
RELEASEFILES:=$(SOURCE:%.tex=%.release-stamp)

all: $(PDFFILES)

publish: $(RELEASEFILES)

%.release-stamp: %.pdf
	touch $@
	scp -p $< alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/pdf/

%.pdf: %.dvi
	umask 002 ; dvipdfmx $< 

%.dvi: %.tex
	# check kanji-code of the tex file.
	iconv -f iso-2022-jp -t iso-2022-jp < $< > /dev/null
	platex $<
	platex $<
	platex $<

clean:
	-rm *.dvi *.aux *.toc *~ *.log *.waux *.out _whizzy_* *.snm *.nav *.jqz
	-touch $(RELEASEFILES)

deb:
	-rm ../*.deb
	debian/rules local-make-orig
	debuild -us -uc -i'.*pdf$'

listtopic:
	lgrep dancersection *-{natsu,fuyu}.tex | sed -n 's/\\dancersection{\([^}]*\)}.*/\1/p'

.PHONY: deb clean all publish listtopic

