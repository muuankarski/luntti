---
layout: default
title: "knitr"
author: "Markus Kainu"
date: "24.08.2014"
---




# Knitr


```r
library(knitr)
opts_chunk$set(list(echo=FALSE,eval=TRUE,cache=TRUE,warning=FALSE,message=FALSE))

# tai 

library(knitr)
opts_chunk$set(list(echo=FALSE,eval=TRUE,cache=TRUE,warning=FALSE,message=FALSE,fig.height=4,dev="pdf",opts_chunk$set(fig.path = paste('figure/my-prefix-', org, sep = ''))))
```


