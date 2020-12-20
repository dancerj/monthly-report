#!/bin/bash

for A in ????-??.muse ; do echo $A; sed -n  's/ - \[\[.*\]\[\([^]]*\)\]\].*$/\1/p' $A ; done | grep -v PDF 

