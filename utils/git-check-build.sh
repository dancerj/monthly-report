#!/bin/bash
# check build in a different directory
set -e

TEMPDIR=$(mktemp -d)

git checkout-index --prefix=${TEMPDIR}/ -a
cd ${TEMPDIR}
make -j5

