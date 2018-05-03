#!/bin/bash

# copy the results to file repo
# ./publish-file.sh html/*

sudo apt-get install -y tex4ht dvi2ps-fontdata-a2n dvi2dvi dvipng jtex-base
for A in *.tex; do
    case $A in 
	*presentation*) ;;
	*natsu*) ;;
	*fuyu*) ;;
	*) 
	    ./htplatex $A jp,2,sections+
	    ;;
    esac
done
sudo apt-get remove -y dvi2ps-fontdata-a2n
rm -f *.dvi *.html

# c.f. bug #XXXX
for A in html/*.html; do
    sed -i -e 's,src="image.*/,src=",' "$A"
    sed -i -f tex4ht/dnp-trim.sed "$A"

    # try to loop until diff is stable
    rm "$A.tmp" # clean up for previous runs.
    while ! diff "$A.tmp" "$A" > /dev/null ; do
	mv "$A.tmp" "$A" || true
	echo "Modifying $A..."
	sed -f tex4ht/dnp-span.sed "$A" > "$A.tmp"
    done
done

rm html/*.tmp
