# image creation

## ビルドの仕方

```shell
inkscape --export-pdf="dotdeb.pdf" dotdeb.svg 
```

## どうやって作成したか

gudeb.svg backgroundの作成方法:

```
convert /usr/share/splashy/themes/spacefun/go.png -modulate 30 -negate -type GrayScale gudeb.svg.background.png
```

## copyright

`desktop-base-6.0.5squeeze1:debian/copyright` から引用：

The SpaceFun theme is c 2010 Valessio S. Brito and released under the GPLv2.
KDM and Splashy themes are c 2010 Yves-Alexis Perez using artwork from Valessio
S. Brito, and are released under GPLv2. 

