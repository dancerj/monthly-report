#!/bin/bash
sudo apt-get install -y tex4ht dvi2ps-fontdata-a2n dvi2dvi dvipng
for A in *.tex; do
    ./htplatex $A jp,2,sections+
done
sudo apt-get remove -y dvi2ps-fontdata-a2n
