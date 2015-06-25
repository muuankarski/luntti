---
layout: default
title: "knitr"
author: "Markus Kainu"
date: "24.08.2014"
---



# Reproducible documents with R & knitr

- [knitr](http://yihui.name/knitr/)-package



# Case 1: Academic paper with pdf/html output



```r
library(knitr)
opts_chunk$set(list(echo=FALSE,eval=TRUE,cache=TRUE,warning=FALSE,message=FALSE))

# tai 

library(knitr)
opts_chunk$set(list(echo=FALSE,eval=TRUE,cache=TRUE,warning=FALSE,message=FALSE,fig.height=4,dev="pdf",opts_chunk$set(fig.path = paste('figure/my-prefix-', org, sep = ''))))
```


# Case 2: Jekyll povered website


