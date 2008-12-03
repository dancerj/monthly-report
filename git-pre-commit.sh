#!/bin/sh
# try to run make before commit.
# add this to .git/hooks/pre-commit and chmod a+x

set -e 

# clean up dvi files, whizzytex generates dvi files, and they need to
# be cleaned or we will try to test dvi->pdf rules only, which is not
# what we want.

rm -f debianmeetingresume*.dvi 

# run a build so that we know it succeeds.
echo 'Run pre-commit make testing'
make 
echo 'done pre-commit make testing'

