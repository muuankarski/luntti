---
layout: default
title: "Survey"
author: "Markus Kainu"
date: "05.09.2014"
---


# Survey

**Resources**

- [survey: analysis of complex survey samples in CRAN](http://cran.r-project.org/web/packages/survey/index.html)
- [Thomas Lumley: Survey analysis in R](http://faculty.washington.edu/tlumley/survey/)


These analysis have been made using [Life in Transition Survey 2](http://www.ebrd.com/pages/research/publications/special/transitionII.shtml). You can load the data in R with following line of code


```r
library(foreign)
temp <- tempfile()
download.file("http://www.ebrd.com/downloads/research/surveys/lits2.dta", temp)
lits2 <- read.dta(temp)
```



## Survey design


```r
library(survey)
d.df <- svydesign(id = ~SerialID, 
                  weights = ~weight, 
                  data = lits2)
```


## Plotting distributions


```r
dpar <- par(mfrow=c(1,2))
svyhist(~q104a_1, design=d.df, 
        main="Survey weighted",
        col="cadetblue")
lines(svysmooth(~q104a_1, d.df, bandwidth=5))
```

```
## Loading required package: KernSmooth
## KernSmooth 2.23 loaded
## Copyright M. P. Wand 1997-2009
```

```r
hist(lits2$q104a_1,  main="Sample unweighted",
     col="cadetblue",prob=TRUE)
lines(density(lits2$q104a_1, adjust=2))
```

![plot of chunk plot_dist](figure/plot_dist.png) 

```r
par(dpar)
```

## Statistical tables 

### Mean Age by country with standard errors


```r
# Create a data.frame out of table
t <- data.frame(svyby(~q104a_1, ~q102_1+country, design=d.df, svymean, na.rm=T))
# New names for data file
names(t) <- c("Sex","Country","mean_age","SE")
# Reorder the columns
t <- t[c(2,1,3,4)]
```

### GRAPH with Errorbars


```r
library(ggplot2)
ggplot(t, aes(x=Country, y=mean_age, fill=Sex)) +
  geom_bar(position="dodge", stat="identity") +
  geom_errorbar(aes(ymin=mean_age-SE, ymax=mean_age+SE), width=.2,
                position=position_dodge(.9)) +
  coord_cartesian(ylim=c(35,65)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```

![plot of chunk meanplot](figure/meanplot.png) 


## Quantities by categorical variable

Let's use variable **q301a**

>The economic situation in our country is better today than around 4 years ago


```r
# manipulate string
library(stringr)
lits2$q301a <- as.factor(str_replace(lits2$q301a, "Don't know", "Dont know"))
# recode
lits2$q301a_rec[lits2$q301a == "Strongly agree"] <- "Agree"
lits2$q301a_rec[lits2$q301a == "Agree"] <- "Agree"
lits2$q301a_rec[lits2$q301a == "Strongly disagree"] <- "Disagree"
lits2$q301a_rec[lits2$q301a == "Disagree"] <- "Disagree"
lits2$q301a_rec[lits2$q301a == "Neither disagree nor agree"] <- "Neither nor"
lits2$q301a_rec[lits2$q301a == "Dont know"] <- "Dont know"
# set levels
lits2$q301a_rec <- factor(lits2$q301a_rec, levels=c("Agree","Neither nor","Disagree","Dont know"))
######
# Re-set the survey design
d.df <- svydesign(id = ~SerialID, 
                  weights = ~weight, 
                  data = lits2)
##
t2 <- data.frame(prop.table(svytable(~q301a_rec+country, d.df),2)*100)
t2 <- t2[!is.na(t2$Freq), ]
##
ggplot(t2, aes(x=country, y=Freq, fill=q301a_rec)) + 
  geom_bar(stat="identity") + 
  theme(legend.position="top") + 
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5))
```

![plot of chunk quant_plot](figure/quant_plot.png) 

### Share agreeing


```r
# Freq table
## as data.frame of relative shares
t3 <- subset(t2, q301a_rec %in% 'Agree')
t3$Freq <- round(t3$Freq,1)
# plot
ggplot(t3, aes(x=reorder(country, Freq), y=Freq,label=Freq)) + 
  geom_bar(stat="identity", position="dodge", fill="cadetblue") + 
  coord_flip(ylim=c(0,100)) + geom_text(posistion=position_dodge(), hjust=-0.1)
```

![plot of chunk shareplot](figure/shareplot.png) 
