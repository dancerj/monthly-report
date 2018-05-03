#!/bin/sh
PATH=/bin:/usr/bin
CDPATH=
umask 0022
fqdn="tokyodebian-team.pages.debian.net"
workdestdir="html/"
if [ $# -lt 1 ]; then
	echo "Usage: $0 pdf-file ... ";
	exit 1;
fi
if ! [ -e $workdestdir ]; then
	mkdir $workdestdir
fi
for pdffile in $*
do
	base=`basename $pdffile .pdf`
	htmldir=html`echo "$base" | sed 's/^debianmeetingresume//' | env LANG=C sed 's/^\(....\).*$/\1/'`
	html="${base}.html"
	thumnail="${base}-01.png"
	needupload="no"
	if ! [ -e $workdestdir$html ] || [ $pdffile -nt $workdestdir$html ]; then
		echo proceeding $pdffile ...
		pdf2htmlEX $pdffile
		sed -i -e '/meta http-equiv/a\
\<meta property="og:title" content="'$base'" \/\>\
\<meta property="og:type" content="html" \/\>\
\<meta property="og:url" content="https:\/\/'$fqdn'\/'$htmldir'\/'$html'" \/\>\
\<meta property="og:image" content="https:\/\/'$fqdn'\/'$htmldir'\/'$thumnail'" \/\>' $html
		mv $html $workdestdir
		needupload="yes"
	fi
	if ! [ -e $workdestdir$thumnail ] || [ $pdffile -nt $workdestdir$thumnail ]; then
		pdftoppm -f 1 -l 1 -scale-to 350 -png $pdffile $base
		mv $thumnail $workdestdir
		needupload="yes"
	fi
	if [ $needupload = "yes" ]; then
		./publish-file.sh $workdestdir$html
		./publish-file.sh $workdestdir$thumnail
	fi
done
exit 0
