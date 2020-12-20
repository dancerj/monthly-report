#!/bin/sh
convert cacert-201012.pdf cacert-201012.jpg
for i in ca*.jpg; do
  djpeg $i | pnmtops | ps2eps > $(basename $i .jpg)
done

mv cacert-201012-0.eps cacertdocs.eps
mv cacert-201012-1.eps cacertorg.eps
mv cacert-201012-2.eps cacertparty.eps


