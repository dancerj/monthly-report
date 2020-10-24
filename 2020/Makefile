SOURCE:=$(wildcard debianmeeting*.tex)
PDFFILES:=$(SOURCE:%.tex=%.pdf)
RELEASEFILES:=$(filter debianmeetingresume2020%.release-stamp,$(SOURCE:%.tex=%.release-stamp))
PLATEX_FLAGS:= -shell-escape -halt-on-error -interaction=batchmode

all: $(PDFFILES)

check: all

publish: $(RELEASEFILES)
	# ファイルをリリースする。clean すると一度全部のファ
	# イルをpublishしたものとみなす。古いファイルを全部アップロード
	# するのを回避します。アップロードしたいファイルは該当する
	# .pdf ファイルをtouchすればリリースします。

%.release-stamp: %.pdf
	../publish-file.sh $<
	touch $@

%.pdf: %.dvi
	set -e; \
	  umask 002 ; \
	  export TMPDIR="$(shell mktemp -d)"; \
	  dvipdfmx -o $@.tmp $< > $@.tmplog 2>&1 || (cat $@.tmplog; exit 1); \
	  rmdir $$TMPDIR
	mv $@.tmp $@

%.dvi: %.tex
	## start of linting stuff
	# check kanji-code of the tex file.
	iconv -f iso-2022-jp -t iso-2022-jp < $< > /dev/null
	# check some obvious spelling mistakes Debian勉強会標準以外の表記を使った場合ここがエラーになります。修正してからコミットしてください。
	../utils/spelllint.sh $<
	## end of linting stuff
	platex $(PLATEX_FLAGS) $< > $@.tmplog 2>&1 || (cat $@.tmplog; exit 1)  # create draft input
	-if [ -s $(<:%.tex=%.idx) ]; then mendex -U $(<:%.tex=%.idx); fi
	platex $(PLATEX_FLAGS) $< > $@.tmplog 2>&1 || (cat $@.tmplog; exit 1)  # create draft content with correct spacing for index and toc
	-if [ -s $(<:%.tex=%.idx) ]; then mendex -U $(<:%.tex=%.idx); fi # recreate index with correct page number
	platex $(PLATEX_FLAGS) $< > $@.tmplog 2>&1 || (cat $@.tmplog; exit 1) # recreate toc with correct page number

clean:
	-rm *.dvi *.aux *.toc *~ *.log *.waux *.out _whizzy_* *.snm *.nav *.jqz *.ind *.ilg *.idx *.idv *.lg *.xref *.4ct *.4tc *.css

	# 一度全部のファイルをpublishしたものとみなす。古いファイルを全部アップロードするのを回避します
	-touch $(RELEASEFILES)

.PHONY: deb clean all publish check
