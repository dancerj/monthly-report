#!/bin/bash
# a whizzytex pdf-ptex hack
set -e

platex "$@"
dvipdfmx ${2/%.tex/.dvi}
