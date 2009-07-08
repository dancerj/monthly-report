#!/bin/bash
# git push script with basic checks.
set -e

if git status; then
    # git status returned 0, which means there was some change
    # pending.
    echo 'E: There is added change in this directory, commit them first.'
    exit 1
fi

if ! git diff --exit-code > /dev/null; then
    # git diff returned 1, which means there was some change pending.
    echo 'E: There is diff in this directory, commit them first.'
    exit 1
fi


make check

git diff origin

echo -n 'Submit this change ? [y/n]:'
read A
case $A in
    y|Y)
	echo 'I: Accepting this change and pushing'
	;;
    *)
	echo 'E: Something other than Y was pressed, aborting'
	exit 1;;
esac

git push
echo 'I: successful push'
