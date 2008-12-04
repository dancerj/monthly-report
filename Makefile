SOURCE:=$(wildcard debianmeeting*.tex)
DVIFILES:=$(SOURCE:%.tex=%.dvi)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
RELEASEFILES:=$(SOURCE:%.tex=%.release-stamp)

all: $(PDFFILES)

publish: $(RELEASEFILES)
	# this gives error when I am not the owner of the
	# file, but fixes all files that I am the owner
	-ssh alioth.debian.org chmod 664 /var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/pdf/*.pdf

%.release-stamp: %.pdf
	scp $< alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/pdf/
	touch $@

%.pdf: %.dvi
	umask 002 ; dvipdfmx -o $@.tmp $< 
	# Just check the first entry to hope it's okay; ignore *-presentation* files 
	# because they don't have dancersection.
	case '$<' in *-presentation*) ;; *) ./utils/pdfshiorilint.sh $(<:%.dvi=%.tex) $@.tmp;; esac
	mv $@.tmp $@

%.dvi: %.tex
	## start of linting stuff
	# check kanji-code of the tex file.
	iconv -f iso-2022-jp -t iso-2022-jp < $< > /dev/null
	# check some obvious spelling mistakes
	./utils/spelllint.sh $<
	# check that pre-commit hook is installed.
	# if this fails, please do:
	# cp git-pre-commit.sh .git/hooks/pre-commit
	diff -u .git/hooks/pre-commit git-pre-commit.sh
	[ -x .git/hooks/pre-commit ]
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

check-syntax:
	$(CC) -c -O2 -Wall $(CHK_SOURCES) -o/dev/null $(shell pkg-config --cflags gtk+-2.0)
