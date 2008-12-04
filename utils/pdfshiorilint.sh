#!/bin/bash
# compare latex source and PDF output to verify that it is correct.
set -e 
set -o pipefail

TEXFILE="$1"
PDFFILE="$2"
LINES=1 # look at first 1 line only.

diff -u <(
    set -o pipefail
    if perl -ne 'use Encode; $val=pack("H*",$1); Encode::from_to($val,"utf-16","utf-8", 1); print $val."\n" if m/Title<(.*)>/ ' "${PDFFILE}" | head -$LINES; then
	:
    else
	echo failed-parsing-pdf
    fi
) <(
    set -o pipefail
    if perl -ne 'use Encode; $val=$1; Encode::from_to($val,"iso-2022-jp","utf-8", 1); print $val."\n" if m/^\\dancersection{(.*?)}/' "${TEXFILE}" | head -$LINES; then
	:
    else
	echo failed-parsing-tex
    fi
) | iconv -f utf-8 -t $(locale charmap) -c 
