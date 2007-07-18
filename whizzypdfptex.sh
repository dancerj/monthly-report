#!/bin/bash
# a whizzytex pdf-ptex hack

platex "$@"
dvipdfmx ${2/%.tex/.dvi}
