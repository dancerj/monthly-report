#!/bin/bash

# copy the results to alioth
# scp -p html/* alioth.debian.org:/var/lib/gforge/chroot/home/groups/tokyodebian/htdocs/html

sudo apt-get install -y tex4ht dvi2ps-fontdata-a2n dvi2dvi dvipng
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
rm *.dvi

# c.f. bug #XXXX
for A in html/*.html; do
    sed -i -e 's,src="image.*/,src=",' "$A"
    sed -i -f tex4ht/dnp-trim.sed "$A"
    rm "$A.tmp"
    while ! diff "$A.tmp" "$A" > /dev/null ; do
	mv "$A.tmp" "$A" || true
	echo "Modifying $A..."
	sed -f tex4ht/dnp-span.sed "$A" > "$A.tmp"
    done
done
