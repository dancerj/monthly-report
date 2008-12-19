#!/bin/bash

if lgrep -i -n \
    'debain\|．\|，\|東京Debian勉強会' \
    /dev/null "$@"  ; then
    exit 1
else
    exit 0
fi
