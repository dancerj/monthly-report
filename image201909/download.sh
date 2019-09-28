#!/bin/sh
[ -f "500px-DebianFamilyTree1210.png" ] || \
    wget "https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/DebianFamilyTree1210.svg/500px-DebianFamilyTree1210.svg.png" -O 500px-DebianFamilyTree1210.png

if [ ! -f "debconf19_group.jpg" ] ; then
    wget "https://wiki.debian.org/DebConf/19/Photos?action=AttachFile&do=get&target=debconf19_group.jpg" -O debconf19_group.jpg
    # mogrify -geometry 800x600 debconf19_group.jpg
fi

[ -f "buster.png" ] || \
    wget "https://bits.debian.org/images/upcoming-buster.png" -O buster.png

[ -f "sd2019.jpg" ] || \
    wget "http://image.gihyo.co.jp/assets/images/cover/2019/641908.jpg" -O sd2019.jpg

[ -f "debianbook.jpg" ] || \
    wget "http://static.lulu.com/browse/product_thumbnail.php?productId=22625767&resolution=320" -O debianbook.jpg
