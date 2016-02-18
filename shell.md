---
layout: default
title: "shell"
author: "Markus Kainu"
date: "18.02.2016"
---



# Päätekomentoja valokuvien editoimiseen

## Tiedostojen nimeäminen


```r
# jpg into JPG
rename -v 's/\.jpg$/\.JPG/' *.jpg
# pvm + aika + jokunimi
for i in *.JPG; do exiv2 -v -r '%Y%m%d.%H%M%S.tammihelmi2014' rename "$i"; done
```

## Kuvien muokkausta



```r
# 
find . -iname '*.JPG' -execdir mogrify -verbose -resize 1200 -quality 95 {} \;

mogrify -verbose -brightness-contrast 1x1 -resize 1200 -quality 95 *.jpg
```




## skripti


```r
#!/bin/bash
 
# processes raw files
cd kuvat_isot

# change the image names
for i in *.jpg;
do
        mv "$i" "${i/.jpg}".JPG;
done


jhead -autorot *.JPG
zip ../isot.zip *.JPG 
cp *.JPG ../kuvat_pienet
cd ../kuvat_pienet
#mogrify -verbose -resize 800 -quality 85 *.JPG
# mogrify -verbose -brightness-contrast 5x5 -resize 800 -quality 85 *.JPG
mogrify -verbose -resize 800 -quality 85 *.JPG # ajetaan vaan koonmuutos, koska uudet kuvat Minnan ottamia ja säädettyjä
zip ../pienet.zip *.JPG 
cd ..
```




## PDF to bitmap



```r
#!/bin/bash

# create dir for the burst pdf pages
mkdir pdfs
# burst source pdf
pdftk  file.pdf  burst  output  pdfs/page_%03d.pdf
# convert all pdfs witihin the folder into jpf
for i in pdfs/*.pdf ; do convert -density 200 "$i" "${i%.*}.jpg" ; done
```



