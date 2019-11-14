#!/bin/sh
# try to run make before commit.
# add this to .git/hooks/pre-commit and chmod a+x

set -e 

# run a build so that we know it succeeds.
echo 'Run pre-commit make testing'
make -j $(nproc)
echo 'done pre-commit make testing'

