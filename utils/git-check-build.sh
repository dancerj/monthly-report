#!/bin/bash
# check build in a different directory
set -e

TEMPDIR=$(mktemp -d)

git checkout-index --prefix=${TEMPDIR}/ -a
cd ${TEMPDIR}
mkdir -p .git/hooks
cp git-pre-commit.sh .git/hooks/pre-commit
make -j5

