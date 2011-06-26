#!/bin/bash

# requires UTF-8 locale to run this shell script.
if [ "$(locale charmap)" != "UTF-8" ]; then
    echo 'changing locale to UTF-8'
    export LC_ALL=ja_JP.UTF-8
    exec /bin/bash "$0" "$@"
fi;

if ! which lgrep > /dev/null; then
    echo 'ERROR: Please install lgrep from lv package'
fi

# Debain -> Debian
# 東京Debian勉強会 -> 東京エリアDebian勉強会
# 句読点は「。、」を使い、「．，」は使わない。

if lgrep -Ij -Ku8 -Ou8 -i -n \
    'debain\|．\|，\|東京Debian勉強会' \
    /dev/null "$@"  ; then
    echo 'ERROR: lgrep for wrong keyword failed. Please check.'
    exit 1
else
    exit 0
fi
