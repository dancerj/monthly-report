#! /bin/sh

gitusername="`git config user.name`"
gituseremail="`git config user.email`"
if [ x = x"$gitusername" ] || [ x = x"$gituseremail" ]; then
    echo "ERROR: please set git config user.name and user.email" >&2
    exit 1
fi

topdir="`git rev-parse --show-toplevel`"

set -x
set -e

for f in "$@"; do
    if basename "$f" | grep -q -E '^debianmeetingresume[0-9]{4}.*.(pdf|html|png)$'; then
        yyyy="`basename "$f" | sed 's/^debianmeetingresume//' | env LANG=C sed 's/^\(....\).*$/\1/'`"
    else
        # yyyy=`date +%Y`
        echo "ERROR: $f: unknown repo to publish" >&2
        exit 1
    fi
    case "${f##*.}" in
        pdf)
            type=pdf
            ;;
        html|png)
            type=html
            ;;
    esac
    repo="${type}${yyyy}"
    repodir="${topdir}/${repo}"
    lockfile="${topdir}/${repo}.lock"
    (
	flock -w 1000 9 || exit 1
	if [ -e "${repodir}/.git" ]; then
            (cd "${repodir}" && git pull)
	else
            (cd "${topdir}" && git clone "git@salsa.debian.org:tokyodebian-team/${repo}.git")
	fi
	cp "$f" "${repodir}/public/"
	(cd "${repodir}/public/" && git add "`basename "$f"`")
	(cd "${repodir}" && git -c user.name="$gitusername" -c user.email="$gituseremail" commit -m "publish" && git push)
    ) 9> "${lockfile}"
done
