---
layout: default
title: "Valokuvaus"
author: "Markus Kainu"
date: "24.08.2014"
---

# Päätekomentoja valokuvien editoimiseen

## Kuvien muokkausta


```r
find . -iname '*.JPG' -execdir mogrify -verbose -resize 1200 -quality 95 {} \;

mogrify -verbose -brightness-contrast 1x1 -resize 1200 -quality 95 *.jpg
```


## Gallerioiden tekemistä


