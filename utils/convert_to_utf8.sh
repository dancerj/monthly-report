#!/usr/bin/bash
# For converting to utf-8 in batch.
# find -name '*.tex' | xargs bash ./utils/convert_to_utf8.sh

set -e

for name in "$@"; do
    filetype=$(file2 "${name}")
    case $filetype in
	*"JIS text"*)
	    echo ${name}
	    iconv -f iso-2022-jp -t utf-8 < "${name}" > "${name}.tmp"
	    mv "${name}.tmp" "${name}"
	    ;;
	*"UTF-8"*|*"ascii text"*)
	    echo ok
	    ;;
	*)
	    echo "other: ${filetype}"
	    ;;
    esac
done
