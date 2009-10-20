#!/bin/bash
# check build in a different directory
TEMPDIR=$(mktemp -d)

git archive --format=tar HEAD | \
    ( cd ${TEMPDIR} &&  
    tar xvf - &&
    mkdir -p .git/hooks &&
    cp git-pre-commit.sh .git/hooks/pre-commit &&
    make -j5 )

