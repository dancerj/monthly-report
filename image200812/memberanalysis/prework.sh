#!/bin/bash

# 2005-2006 prework format is different from 2007-
for A in debianmeetingresume200[56]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\subsection{事前課題紹介}/,/\\dancersection/  { if ($0 ~ /\\subsubsection{(.*)}/ ) {gsub(/\\subsubsection{/,""); gsub(/}/,""); print $0}}' ; done 

# 2007-2008 prework format

for A in debianmeetingresume200[78]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\dancersection{事前課題}/,/%%% trivia quiz/  { if ($0 ~ /\\subsection{(.*)}/ ) {gsub(/\\subsection{/,""); gsub(/}/,""); print $0}}' ; done 
