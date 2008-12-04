#!/bin/bash

if lgrep -i -n debain "$@"; then
    exit 1
else
    exit 0
fi
