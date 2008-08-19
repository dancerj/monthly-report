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
	## start of linting stuff
	# check kanji-code of the tex file.
	iconv -f iso-2022-jp -t iso-2022-jp < $< > /dev/null
	# check that pre-commit hook is installed.
	diff .git/hooks/pre-commit git-pre-commit.sh
	## end of linting stuff
	platex $< # create draft input
	-mendex $(<:%.tex=%)
	platex $< # create draft content with correct spacing for index and toc
	-mendex $(<:%.tex=%) # recreate index with correct page number
	platex $< # recreate toc with correct page number

clean:
	-rm *.dvi *.aux *.toc *~ *.log *.waux *.out _whizzy_* *.snm *.nav *.jqz *.ind *.ilg *.idx *.idv *.lg *.xref *.4ct *.4tc *.css


	-touch $(RELEASEFILES)

deb:
	-rm ../*.deb
	debian/rules local-make-orig
	debuild -us -uc -i'.*pdf$$|.git'

listtopic:
	lgrep dancersection *-{natsu,fuyu}.tex | sed -n 's/\\dancersection{\([^}]*\)}.*/\1/p'

.PHONY: deb clean all publish listtopic

