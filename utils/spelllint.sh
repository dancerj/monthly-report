#!/bin/bash

if lgrep -i -n \
    'debain\|��\|��\|���Debian�ٶ���' \
    /dev/null "$@"  ; then
    exit 1
else
    exit 0
fi
