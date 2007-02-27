SOURCE:=$(wildcard debianmeeting*.tex)
DVIFILES:=$(SOURCE:%.tex=%.dvi)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
RELEASEFILES:=$(SOURCE:%.tex=%.release-stamp)

all: $(PDFFILES)

release: $(RELEASEFILES)

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

deb:
	-rm ../*.deb
	debuild -us -uc 
	[ ! -f ../aliothweb/mountpoint ] || sshfs -o nonempty alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs ../aliothweb
	[ ! -f ../aliothweb/mountpoint ]
	cd ../ && dpkg-scanpackages . . > Packages
	gzip ../Packages
	cp ../Packages.gz ../*.deb ../aliothweb/deb/

.PHONY: deb clean all release

