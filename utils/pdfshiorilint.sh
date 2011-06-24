#!/bin/bash
# compare latex source and PDF output to verify that it is correct.

# このコードではLaTeXの入力コードとPDFファイルの出力を比較して、目次か
# ら生成されるしおりが適切な文字コードになっているかを確認しています。
# 一個目のタイトルだけを比較しているので一個目のdancersectionに日本語が
# はいっていないとうまく確認できません。
#
# もしこれが失敗したら、PDFしおりの文字コードの設定がおかしいか、LaTeX
# のソースがおかしいか、目次が生成されていないかを疑ってください。
#
# 目次が生成されていない場合: latex を再度実行
#
# LaTeXのソースがおかしい: なおしてください。\dancersectionの途中に改行
# があったりするとダメだったとおもいます。
#
# PDFしおりの文字コードの設定がおかしい: 黒魔術の世界へようこそ。 

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
