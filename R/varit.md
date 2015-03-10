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

![plot of chunk vari1](figure/vari1-1.png) 



```r
library(ggplot2)
mtcars$brands <- row.names(mtcars)     
df <- mtcars[1:10,]
plot <- ggplot(df, aes(x=brands,y=cyl,fill=factor(carb)))
plot <- plot + geom_bar(stat="identity")
plot <- plot + scale_fill_brewer(palette="Set1")
plot
```

![plot of chunk vari2](figure/vari2-1.png) 



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

![plot of chunk vari3](figure/vari3-1.png) 


## WesAnderson paletters

- [A Wes Anderson color palette for R](https://github.com/karthik/wesanderson)
- [Wes Anderson Palettes.](http://wesandersonpalettes.tumblr.com/)


**script copy pasted from <https://github.com/karthik/wesanderson/blob/master/README.Rmd>**



```r
library(knitr)
library(wesanderson)
kable(namelist)
```

```
## Error in is.data.frame(x): object 'namelist' not found
```



```r
display.wes.palette(4, "GrandBudapest")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "GrandBudapest2")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "Moonrise1")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "Moonrise2")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(5, "Moonrise3")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "Royal1")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(5, "Royal2")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "Chevalier")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(5, "Cavalcanti")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(5, "Zissou")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(5, "Darjeeling")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
#display.wes.palette(5, "Darjeeling2")
display.wes.palette(4, "FantasticFox")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```

```r
display.wes.palette(4, "Rushmore")
```

```
## Error in eval(expr, envir, enclos): could not find function "display.wes.palette"
```


```r
ggplot(iris, aes(Sepal.Length, Sepal.Width, color = Species)) + 
geom_point(size = 3) + 
scale_color_manual(values = wes.palette(3, "GrandBudapest")) + 
theme_gray()
```

```
## Error in scale$palette(n): could not find function "wes.palette"
```



```r
qplot(factor(cyl), data=mtcars, geom="bar", fill=factor(vs)) + 
scale_fill_manual(values = wes.palette(2, "Royal1"))
```

```
## Error in scale$palette(n): could not find function "wes.palette"
```



```r
library(wesanderson)
pal <- wes.palette(name = "Zissou", type = "continuous")
```

```
## Error in eval(expr, envir, enclos): could not find function "wes.palette"
```

```r
# heatmap is a local dataset
ggplot(heatmap, aes(x = X2, y = X1, fill = value)) +
 geom_tile() + 
 scale_fill_gradientn(colours = pal(100)) + 
scale_x_discrete(expand = c(0, 0)) +
scale_y_discrete(expand = c(0, 0)) + coord_equal() 
```

```
## Error in match(x, table, nomatch = 0L): could not find function "pal"
```



