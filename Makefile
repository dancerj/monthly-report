SOURCE:=$(wildcard debianmeeting*.tex)
DVIFILES:=$(SOURCE:%.tex=%.dvi)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
RELEASEFILES:=$(SOURCE:%.tex=%.release-stamp)

# server which hosts files for alioth.
ALIOTH_FILEHOSTING:=wagner.debian.org
all: $(PDFFILES)

check: all

publish: $(RELEASEFILES)
	# ファイルのリリースをするコマンド。clean すると一度全部のファ
	# イルをpublishしたものとみなす。古いファイルを全部アップロード
	# するのを回避します。アップロードしたいファイルは該当する
	# .pdf ファイルをtouchすればリリースします。
	#
	# this gives error when I am not the owner of the
	# file, but fixes all files that I am the owner
	-ssh ${ALIOTH_FILEHOSTING} chmod 664 /home/groups/tokyodebian/htdocs/pdf/*.pdf

%.release-stamp: %.pdf
	# copy PDF file to a temporal location, and fixup permissions, and move to final destination.
	scp $< ${ALIOTH_FILEHOSTING}:/home/groups/tokyodebian/htdocs/pdf/$<.tmp
	ssh ${ALIOTH_FILEHOSTING} "chmod 664 /home/groups/tokyodebian/htdocs/pdf/$<.tmp && mv /home/groups/tokyodebian/htdocs/pdf/$<.tmp /home/groups/tokyodebian/htdocs/pdf/$<"
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
	# check some obvious spelling mistakes Debian勉強会標準以外の表記を使った場合ここがエラーになります。修正してからコミットしてください。
	./utils/spelllint.sh $<
	# check that pre-commit hook is installed.
	# if this fails, please do:
	# cp git-pre-commit.sh .git/hooks/pre-commit
	# コミットフックをインストールしていないとここでエラーになります。ここがエラーになったらエラーを放置しないで修正すること!
	diff -u .git/hooks/pre-commit git-pre-commit.sh
	[ -x .git/hooks/pre-commit ]
	## end of linting stuff
	platex -halt-on-error $< # create draft input
	-mendex $(<:%.tex=%)
	platex -halt-on-error $< # create draft content with correct spacing for index and toc
	-mendex $(<:%.tex=%) # recreate index with correct page number
	platex -halt-on-error $< # recreate toc with correct page number

clean:
	-rm *.dvi *.aux *.toc *~ *.log *.waux *.out _whizzy_* *.snm *.nav *.jqz *.ind *.ilg *.idx *.idv *.lg *.xref *.4ct *.4tc *.css

	# 一度全部のファイルをpublishしたものとみなす。古いファイルを全部アップロードするのを回避します
	-touch $(RELEASEFILES)

deb:
	-rm ../*.deb
	debian/rules local-make-orig
	debuild -us -uc -i'.*pdf$$|.git'

listtopic:
	# for generating undocumenteddebian.muse
	lgrep dancersection *-{natsu,fuyu}.tex | \
		sed -n 's/:\\dancersection{\([^}]*\)}.*/:\1/p'

.PHONY: deb clean all publish listtopic check

check-syntax:
	$(CC) -c -O2 -Wall $(CHK_SOURCES) -o/dev/null $(shell pkg-config --cflags gtk+-2.0)
