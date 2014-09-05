---
layout: default
title: "Grafiikka"
author: "Markus Kainu"
date: "05.09.2014"
---


# Graphics using with ggplot2


## Obtaining the data and defining the colors

```r
library(ggplot2)
library(laeken)
data(eusilc)
df <- eusilc
head(df)
```

```
##   db030 hsize db040 rb030 age  rb090 pl030 pb220a py010n py050n py090n
## 1     1     3 Tyrol   101  34 female     2     AT   9756      0      0
## 2     1     3 Tyrol   102  39   male     1  Other  12472      0      0
## 3     1     3 Tyrol   103   2   male  <NA>   <NA>     NA     NA     NA
## 4     2     4 Tyrol   201  38 female     7     AT  12487      0      0
## 5     2     4 Tyrol   202  43   male     1     AT  42821      0      0
## 6     2     4 Tyrol   203  11   male  <NA>   <NA>     NA     NA     NA
##   py100n py110n py120n py130n py140n hy040n hy050n hy070n hy080n hy090n
## 1      0      0      0      0      0   4274   2428      0      0  33.39
## 2      0      0      0      0      0   4274   2428      0      0  33.39
## 3     NA     NA     NA     NA     NA   4274   2428      0      0  33.39
## 4      0      0      0      0      0      0   1550      0      0   2.13
## 5      0      0      0      0      0      0   1550      0      0   2.13
## 6     NA     NA     NA     NA     NA      0   1550      0      0   2.13
##   hy110n hy130n hy145n eqSS eqIncome db090 rb050
## 1      0      0      0  1.8    16091 504.6 504.6
## 2      0      0      0  1.8    16091 504.6 504.6
## 3      0      0      0  1.8    16091 504.6 504.6
## 4      0      0      0  2.1    27076 493.4 493.4
## 5      0      0      0  2.1    27076 493.4 493.4
## 6      0      0      0  2.1    27076 493.4 493.4
```

```r
manual.color <- scale_color_manual(values=c("#CC79A7","#E69F00",
                                       "#56B4E9","#000000",
                                       "#009E73","#D55E00",
                                       "#0072B2","#999999",
                                       "#00FF00","Dim Grey",
                                       "#56B4E9","#000000",
                                       "#009E73","#D55E00",
                                       "#0072B2","#999999"))

manual.fill <- scale_fill_manual(values=c("#CC79A7","#E69F00",
                                       "#56B4E9","#000000",
                                       "#009E73","#D55E00",
                                       "#0072B2","#999999",
                                       "#00FF00","Dim Grey",
                                       "#56B4E9","#000000",
                                       "#009E73","#D55E00",
                                       "#0072B2","#999999"))
```


## Bar plot

### Proportions of female and male headed households by region

```r
library(ggplot2)
library(grid)
tbl <- data.frame(prop.table(table(df$db040,df$rb090),1) * 100)
tbl$Freq <- round(tbl$Freq, 1)
# ordering the levels of rdb040 by femla share
df.order <- subset(tbl, Var2 == 'female')
df.order <- df.order[order(df.order$Freq),]
tbl$Var1 <- factor(tbl$Var1, levels = df.order$Var1)
  # bar plot
ggplot(tbl, aes(x=Var2,y=Freq,label=Freq,fill=Var1)) +
  geom_bar(position="dodge", stat="identity") +
  geom_text(position = position_dodge(width=1), vjust=-0.5, size=3) +
  labs(x="xlab",y="ylab") +
  labs(title="plot title") +
  theme(axis.text.x  = element_text(angle=90, vjust= 0.5)) +
  coord_cartesian(ylim=c(0,75)) + 
  annotate("text", x = 1.5, y = 65, label = "Some text here") +
  theme(legend.title=element_blank()) +
  theme(legend.key.size = unit(3, "mm")) +
  theme(legend.position="top") +
  manual.fill
```

```
## ymax not defined: adjusting position using y instead
```

![plot of chunk tolppa1](figure/tolppa1.png) 

## Line Plot


```r
df <- read.csv("http://vincentarelbundock.github.com/Rdatasets/csv/Ecdat/Cigarette.csv")
df$year <- as.numeric(df$year)

cnames <- subset(df, year == 1995)
ggplot(df, 
       aes(x=year,y=packpc,group=state,color=state)) +
  geom_line() + 
  geom_point() +
  scale_x_continuous(breaks=1985:1995) +
  geom_text(data=cnames, aes(x=year,y=packpc,label=state), 
            size=4, hjust=-0.2) +
  labs(x="year",y="number of packs per capita") +
  labs(title="The Cigarette Consumption Panel Data Set") +
  theme(legend.position="none")
```

![plot of chunk viiva1](figure/viiva1.png) 

## Scatter plots

### Age vs. household income by region and sex

```r
df <- eusilc
# aggregate a table
tbl <- aggregate(eqIncome~db040+rb090+age, 
                            median,
                            data=df)
# subset to cover ages 18-75
tbl <- subset(tbl, age > 17 & age < 76)
# plot
ggplot(tbl, aes(x=age,y=eqIncome,color=rb090)) +
  geom_point() + 
  facet_wrap(~db040) +
  geom_smooth(method=lm, se=TRUE) +
  labs(x="xlab",y="ylab") +
  labs(title="plot title") +
  theme(axis.text.x  = element_text(angle=90, vjust= 0.5)) +
  theme(legend.title=element_blank()) +
  theme(legend.key.size = unit(3, "mm")) +
  theme(legend.position="top") +
  manual.color
```

![plot of chunk hajonta1](figure/hajonta1.png) 


## Distributions by ageclass, region and gender

### As a density plot


```r
df <- eusilc
df$age_class[df$age < 18] <- '0-17'
df$age_class[df$age >= 18 & df$age < 25] <- '18-24'
df$age_class[df$age >= 25 & df$age < 55] <- '26-54'
df$age_class[df$age >= 55 & df$age < 65] <- '55-64'
df$age_class[df$age >= 65] <- '65 <'

ggplot(df, aes(x=eqIncome,fill=age_class)) +
  geom_density(alpha=.4) +
  facet_grid(rb090~db040) +
  labs(x="xlab",y="ylab") +
  labs(title="plot title") +
  theme(axis.text.x  = element_text(angle=90, vjust= 0.5)) +
  theme(legend.title=element_blank()) +
  theme(legend.key.size = unit(3, "mm")) +
  theme(legend.position="top") +
  coord_cartesian(xlim=c(0,30000)) +
  manual.fill
```

![plot of chunk silc1](figure/silc1.png) 

### As a box plot


```r
ggplot(df, aes(x=age_class,y=eqIncome, fill=rb090)) +
  geom_boxplot() +
  facet_wrap(~db040) +
  labs(x="xlab",y="ylab") +
  labs(title="plot title") +
  theme(axis.text.x  = element_text(angle=90, vjust= 0.5)) +
  theme(legend.title=element_blank()) +
  theme(legend.key.size = unit(3, "mm")) +
  theme(legend.position="top") +
  coord_cartesian(ylim=c(0,30000)) +
  manual.fill
```

![plot of chunk silc2](figure/silc2.png) 


