#!/bin/bash
# For creating per-year directory with necessary symlinks. Run inside
# the year (e.g. 2020) subdirectory.

set -e

SYMLINKDIRS=(
    beamerthemeKansaiDebian.sty
    beamerthemeKyoto.sty
    beamerthemeTokyo.sty
    image200502
    image200607
    image200703
    image200707
    image200802
    image201006
    image2012-natsu
    kansaimonthlyreport.sty
    monthlypresentation.sty
    monthlyreport.sty
)

# please run this script in subdirectory.
[ -f ../README.md ]

for D in "${SYMLINKDIRS[@]}"; do
    ln -s ../$D .
    git add $D
done
