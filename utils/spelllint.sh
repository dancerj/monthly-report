#!/bin/bash

if ! which lgrep; then
    echo 'ERROR: Please install lgrep from lv package'
fi

# Debain -> Debian
# ���Debian�ٶ��� -> ������ꥢDebian�ٶ���
# �������ϡ֡����פ�Ȥ����֡����פϻȤ�ʤ���

if lgrep -i -n \
    'debain\|��\|��\|���Debian�ٶ���' \
    /dev/null "$@"  ; then
    echo 'ERROR: lgrep for wrong keyword failed. Please check.'
    exit 1
else
    exit 0
fi
