---
layout: default
title: "Manipulointi"
author: "Markus Kainu"
date: "24.08.2014"
---




# Datan manipuloimista


## Datan kääntäminen


```r
# pitkästä leveään
library(reshape2)
df.wide <- dcast(df.long, region + cntry ~ year, value.var="value")
# leveästä to pitkään
library(reshape2)
df.long <- melt(df.wide, id.vars=c("region","cntry"))
```

## Na solujen poistaminen


```r
df <- df[!is.na(df$Var1),]
```

## Faktorit numeerisiksi


```r
df$f <- factor(df$f)
df$f.num <- as.numeric(levels(df$f))[df$f]
```

## Removing duplicats



```r
df <- df[!duplicated(dat[c("var1","var2","var3")]),]
```


## Satunnaisia linkkejä

- [tidy data and tidy tools](http://vita.had.co.nz/papers/tidy-data-pres.pdf)
- [Lists and data cleaning](https://dl.dropbox.com/u/7710864/courseraPublic/otherResources/lecture3/index.html#1)
- [Hadley Wickham on regular expressions](http://stat405.had.co.nz/lectures/14-reg-exp.pdf)

