#!/bin/sh
PATH=/bin:/usr/bin
CDPATH=
umask 0022
fqdn="tokyodebian.alioth.debian.org"
alioth="alioth.debian.org"
tmp_ext=".tmp.${USERNAME}"
aliothdir="/home/groups/tokyodebian/htdocs/html/"
if [ $# -lt 1 ]; then
	echo "Usage: $0 pdf-file ... ";
	exit 1;
fi
for pdffile in $*
do
	echo proceeding $pdffile ...
	base=`basename $pdffile .pdf`
	html="${base}.html"
	thumnail="${base}-01.png"
	if ! [ -e $html ] || [ $pdffile -nt $html ]; then
		pdf2htmlEX $pdffile
		sed -i -e '/meta http-equiv/a\
\<meta property="og:title" content="'$base'" \/\>\
\<meta property="og:type" content="html" \/\>\
\<meta property="og:url" content="http:\/\/'$fqdn'\/html\/'$html'" \/\>\
\<meta property="og:image" content="http:\/\/'$fqdn'\/html\/'$thumnail'" \/\>' $html
	fi
	if ! [ -e $thumnail ] || [ $pdffile -nt $thumnail ]; then
			pdftoppm -f 1 -l 1 -scale-to 350 -png $pdffile $base
	fi
    scp $html ${alioth}:${aliothdir}${html}${tmp_ext}
    scp $thumnail ${alioth}:${aliothdir}${thumnail}${tmp_ext}
    ssh ${alioth} "chmod 664 ${aliothdir}${html}${tmp_ext} && mv ${aliothdir}${html}${tmp_ext} ${aliothdir}${html}"
    ssh ${alioth} "chmod 664 ${aliothdir}${thumnail}${tmp_ext} && mv ${aliothdir}${thumnail}${tmp_ext} ${aliothdir}${thumnail}"
done
exit 0
