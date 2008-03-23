#!/bin/sh
# try to run make before commit.
# add this to .git/hooks/pre-commit and chmod a+x

echo 'Run pre-commit make testing'
make 
echo 'done pre-commit make testing'

