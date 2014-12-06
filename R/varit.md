---
layout: default
title: "Värit"
author: "Markus Kainu"
date: "06.12.2014"
---




# Värit

## Color brewer

[Cindy Brewer: helping you choose better color scales for maps](http://blog.revolutionanalytics.com/2014/12/cindy-brewer-helping-you-choose-better-color-scales-for-maps.html)


```r
library(RColorBrewer)
display.brewer.all()
```

![plot of chunk unnamed-chunk-2](../figure/unnamed-chunk-2-1.png) 




```r
library(ggplot2)
mtcars$brands <- row.names(mtcars)     
df <- mtcars[1:10,]
plot <- ggplot(df, aes(x=brands,y=cyl,fill=factor(carb)))
plot <- plot + geom_bar(stat="identity")
plot <- plot + scale_fill_brewer(palette="Set1")
plot
```

![plot of chunk unnamed-chunk-3](../figure/unnamed-chunk-3-1.png) 



```r
library(ggplot2)
mtcars$brands <- row.names(mtcars)     
df <- mtcars[1:8,]
plot <- ggplot(df, aes(x=hp,y=qsec,color=brands,label=brands))
plot <- plot + geom_point()
plot <- plot + geom_text(family = "Gentium", hjust=-.1)
plot <- plot + scale_color_brewer(palette="Dark2")
plot <- plot + theme(legend.position = "none")
plot
```

![plot of chunk unnamed-chunk-4](../figure/unnamed-chunk-4-1.png) 


## WesAnderson paletters

- [A Wes Anderson color palette for R](https://github.com/karthik/wesanderson)
- [Wes Anderson Palettes.](http://wesandersonpalettes.tumblr.com/)



```r
library(knitr)
library(wesanderson)
kable(namelist)
```



|movies         | wesnums|
|:--------------|-------:|
|GrandBudapest  |       4|
|Moonrise1      |       4|
|Royal1         |       4|
|Moonrise2      |       4|
|Cavalcanti     |       5|
|Royal2         |       5|
|GrandBudapest2 |       4|
|Moonrise3      |       5|
|Chevalier      |       4|
|Zissou         |       5|
|FantasticFox   |       5|
|Darjeeling     |       5|
|Rushmore       |       5|



```r
display.wes.palette(4, "GrandBudapest")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-1.png) 

```r
display.wes.palette(4, "GrandBudapest2")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-2.png) 

```r
display.wes.palette(4, "Moonrise1")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-3.png) 

```r
display.wes.palette(4, "Moonrise2")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-4.png) 

```r
display.wes.palette(5, "Moonrise3")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-5.png) 

```r
display.wes.palette(4, "Royal1")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-6.png) 

```r
display.wes.palette(5, "Royal2")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-7.png) 

```r
display.wes.palette(4, "Chevalier")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-8.png) 

```r
display.wes.palette(5, "Cavalcanti")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-9.png) 

```r
display.wes.palette(5, "Zissou")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-10.png) 

```r
display.wes.palette(5, "Darjeeling")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-11.png) 

```r
#display.wes.palette(5, "Darjeeling2")
display.wes.palette(4, "FantasticFox")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-12.png) 

```r
display.wes.palette(4, "Rushmore")
```

![plot of chunk lifeaquatic](../figure/lifeaquatic-13.png) 


```r
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
geom_point(size = 3) + 
scale_color_manual(values = wes.palette(3, "GrandBudapest")) + 
theme_gray()
```

![plot of chunk ggplot2](../figure/ggplot2-1.png) 



```r
qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(vs)) + 
scale_fill_manual(values = wes.palette(2, "Royal1"))
```

![plot of chunk ggplot1](../figure/ggplot1-1.png) 



```r
library(wesanderson)
pal <- wes.palette(name = "Zissou", type = "continuous")
# heatmap is a local dataset
ggplot(heatmap, aes(x = X2, y = X1, fill = value)) +
 geom_tile() + 
 scale_fill_gradientn(colours = pal(100)) + 
scale_x_discrete(expand = c(0, 0)) +
scale_y_discrete(expand = c(0, 0)) + coord_equal() 
```

![plot of chunk zissou_heatmap](../figure/zissou_heatmap-1.png) 



