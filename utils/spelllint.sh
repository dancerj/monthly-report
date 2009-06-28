#!/bin/bash

if ! which lgrep; then
    echo 'ERROR: Please install lgrep from lv package'
fi

# Debain -> Debian
# 東京Debian勉強会 -> 東京エリアDebian勉強会
# 句読点は「。、」を使い、「．，」は使わない。

if lgrep -i -n \
    'debain\|．\|，\|東京Debian勉強会' \
    /dev/null "$@"  ; then
    echo 'ERROR: lgrep for wrong keyword failed. Please check.'
    exit 1
else
    exit 0
fi
