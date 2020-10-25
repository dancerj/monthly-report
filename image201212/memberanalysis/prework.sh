#!/bin/bash

# 2005-2006 prework format is different from 2007-
for A in debianmeetingresume200[56]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\subsection{事前課題紹介}/,/\\dancersection/  { if ($0 ~ /\\subsubsection{(.*)}/ ) {gsub(/\\subsubsection{/,""); gsub(/}/,""); print $0}}' ; done 

# 2007-2008 prework format

for A in debianmeetingresume200[78]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\dancersection{事前課題}/,/%%% trivia quiz/  { if ($0 ~ /\\subsection{(.*)}/ ) {gsub(/\\subsection{/,""); gsub(/}/,""); print $0}}' ; done 

# 2009 prework format
for A in image2009??/prework.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk ' { if ($0 ~ /\\begin{prework}{(.*)}/ ) {gsub(/\\begin{prework}{/,""); gsub(/}/,""); print $0}}' ; done 

# 2010-2012 prework format; unfortunately, some are in EUC-JP, some are in ISO-2022-JP.
for A in image201???/prework.tex; do echo $A;  nkf -w $A | awk ' { if ($0 ~ /\\begin{prework}{(.*)}/ ) {gsub(/\\begin{prework}{/,""); gsub(/}/,""); value =value "" $0 ","}} END {print value}' ; done 

