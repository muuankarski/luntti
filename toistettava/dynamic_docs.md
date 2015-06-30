---
layout: default
title: "Reproducible documents with R & knitr"
author: "Markus Kainu"
date: "24.08.2015"
---




# Reproducible documents with R & knitr

**This summary is created for FAO R-user group meeting on July 1, 2015**


- [knitr](http://yihui.name/knitr/)-package

## Books

- [Dynamic Documents with R and knitr](https://www.crcpress.com/product/isbn/9781482203530)
    - [Github-repo](https://github.com/yihui/knitr-book/)
- [Reproducible Research with R and R Studio](https://www.crcpress.com/product/isbn/9781466572843)
    - [Github-repo](https://github.com/christophergandrud/Rep-Res-Book)


# Introduction

## Theory

- **Literate programming** is an approach to programming introduced by Donald Knuth in which a program is given as an explanation of the program logic in a natural language, such as English, interspersed with snippets of macros and traditional source code, from which a compilable source code can be generated. [^1]
- **Reproducibility**
    - Reproducibility for the (scientific) community
    - Reprocibility for future you


## Tools

R-packages

- [Sweave](https://www.statistik.lmu.de/~leisch/Sweave/)
- [knitr](http://yihui.name/knitr/)

Rstudio integration

- markdown


Standalone tools 

- Pandoc

## Glossary

- .Rmd -> R Markdown
- .Rnw -> R 

# The Workflow

***
***

![](dynamic2.png)

***

![](dynamic4.png)

***

![](dynamic6.png)

***
***


# Case 1: Simple standalone docs

## R script

- [script.R](script.R)


```r
knitr::spin("script.R")
```


## R Markdown 

- [rmarkdown.Rmd](rmarkdown.Rmd)



```r
# into html
knitr::knit2html("rmarkdown.Rmd")
# into latex pdf
knitr::knit2latex("rmarkdown.Rmd")
# into docx
knitr::knit2latex("rmarkdown.Rmd")
# into odt
knitr::knit2latex("rmarkdown.Rmd")
```


## R Sweave

- [rsweave.Rnw](rsweave.Rnw)



```r
# into latex pdf
knitr::knit2latex("rmarkdown.Rmd")
```


# Case 2: Academic paper with pdf/html output

- [https://github.com/muuankarski/faosyb_paper](https://github.com/muuankarski/faosyb_paper)

# Case 3: Jekyll povered website

- [This website](http://muuankarski.github.io/luntti/)
- [source](https://github.com/muuankarski/luntti)

# Case 4: FAO Statistical Pocketbnook







[^1]: <https://en.wikipedia.org/wiki/Literate_programming>



```r
sessionInfo()
```

```
## R version 3.2.1 (2015-06-18)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 14.04.2 LTS
## 
## locale:
##  [1] LC_CTYPE=en_GB.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_GB.UTF-8        LC_COLLATE=en_GB.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_GB.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] grid      stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
##  [1] tidyr_0.2.0        dplyr_0.4.2        wesanderson_0.3.2 
##  [4] survey_3.30-3      stringr_1.0.0      RColorBrewer_1.1-2
##  [7] laeken_0.4.6       MASS_7.3-41        KernSmooth_2.23-14
## [10] foreign_0.8-64     extrafont_0.17     boot_1.3-16       
## [13] ggplot2_1.0.1      knitr_1.10.5      
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.11.6      highr_0.5        formatR_1.2      plyr_1.8.3      
##  [5] tools_3.2.1      digest_0.6.8     evaluate_0.7     gtable_0.1.2    
##  [9] DBI_0.3.1        yaml_2.1.13      parallel_3.2.1   proto_0.3-10    
## [13] Rttf2pt1_1.3.3   R6_2.0.1         rmarkdown_0.7    reshape2_1.4.1  
## [17] extrafontdb_1.0  magrittr_1.5     codetools_0.2-11 scales_0.2.5    
## [21] htmltools_0.2.6  rsconnect_0.3.79 assertthat_0.1   colorspace_1.2-6
## [25] labeling_0.3     stringi_0.5-5    lazyeval_0.1.10  munsell_0.4.2
```


