#!/bin/bash

# 2005-2006 prework format is different from 2007-
for A in debianmeetingresume200[56]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\subsection{»öÁ°²ÝÂê¾Ò²ð}/,/\\dancersection/  { if ($0 ~ /\\subsubsection{(.*)}/ ) {gsub(/\\subsubsection{/,""); gsub(/}/,""); print $0}}' ; done 

# 2007-2008 prework format

for A in debianmeetingresume200[78]??.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk '/\\dancersection{»öÁ°²ÝÂê}/,/%%% trivia quiz/  { if ($0 ~ /\\subsection{(.*)}/ ) {gsub(/\\subsection{/,""); gsub(/}/,""); print $0}}' ; done 

# 2009 prework format
for A in image2009??/prework.tex; do echo $A; iconv -f iso-2022-jp -t euc-jp $A | awk ' { if ($0 ~ /\\begin{prework}{(.*)}/ ) {gsub(/\\begin{prework}{/,""); gsub(/}/,""); print $0}}' ; done 

# 2010 prework format; unfortunately, some are in EUC-JP, some are in ISO-2022-JP.
for A in image2010??/prework.tex; do echo $A;  nkf -w $A | awk ' { if ($0 ~ /\\begin{prework}{(.*)}/ ) {gsub(/\\begin{prework}{/,""); gsub(/}/,""); print $0}}' ; done 