#!/bin/bash
# compare latex source and PDF output to verify that it is correct.
set -e 
set -o pipefail

TEXFILE="$1"
PDFFILE="$2"

diff -u <(
    perl -ne 'use Encode; $val=pack("H*",$1); Encode::from_to($val,"utf-16","utf-8", 1); print $val."\n" if m/Title<(.*)>/ ' "${PDFFILE}" || echo failed-parsing-pdf
) <(
    perl -ne 'use Encode; $val=$1; Encode::from_to($val,"iso-2022-jp","utf-8", 1); print $val."\n" if m/^\\dancersection{(.*?)}/' "${TEXFILE}" || echo failed-parsing-tex
) | iconv -f utf-8 -t $(locale charmap) -c 
