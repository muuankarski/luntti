---
layout: default
title: "Reproducible documents with R & knitr"
author: "Markus Kainu"
date: "24.08.2015"
---




# Reproducible documents with R & knitr

**This summary is prepared for FAO R-user group meeting on July 1, 2015**


- [knitr](http://yihui.name/knitr/)-package

## Resources

### Books

- [Dynamic Documents with R and knitr](https://www.crcpress.com/product/isbn/9781482203530)
    - [Github-repo](https://github.com/yihui/knitr-book/)
- [Reproducible Research with R and R Studio](https://www.crcpress.com/product/isbn/9781466572843)
    - [Github-repo](https://github.com/christophergandrud/Rep-Res-Book)

### Rstudio

- [Rmarkdown cheatsheet](http://www.rstudio.com/wp-content/uploads/2015/02/rmarkdown-cheatsheet.pdf)
- [R Markdown — Dynamic Documents for R](http://rmarkdown.rstudio.com/)

# Introduction

## Theory

- **Literate programming** is an approach to programming introduced by Donald Knuth in which a program is given as an explanation of the program logic in a natural language, such as English, interspersed with snippets of macros and traditional source code, from which a compilable source code can be generated. [^1]
- **Reproducibility**
    - Reproducibility for the (scientific) community
    - Reprocibility for future you


## Tools

### R-packages

- [Sweave](https://www.statistik.lmu.de/~leisch/Sweave/)
- [knitr](http://yihui.name/knitr/)
- [rmarkdown](http://yihui.name/knitr/)

### Other

- [Pandoc](http://pandoc.org/)

## Glossary

- .Rmd -> R Markdown
- .Rnw -> R Sweave

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

## R script / notebook format

- Example file: [script.R](script.R)
- [Compiling Notebooks from R Scripts](http://rmarkdown.rstudio.com/r_notebook_format.html)
- [Build a report based on an R script](http://yihui.name/knitr/demo/stitch/)
- [Example](https://github.com/yihui/knitr/blob/master/inst/examples/knitr-spin.R)


```r
knitr::spin("script.R")
rmarkdown::render("script.R")
rmarkdown::render("script.R", "pdf_document")
```


## R Markdown 

- Example file: [rmarkdown.Rmd](rmarkdown.Rmd)



```r
# into html
rmarkdown::render('rmarkdown.Rmd')
```


## R Sweave

- Example file: [rsweave.Rnw](rsweave.Rnw)



```r
# into latex pdf
knitr::knit2latex("rmarkdown.Rmd")
```


# Case 2: Academic paper with pdf/html output

- [https://github.com/muuankarski/faosyb_paper](https://github.com/muuankarski/faosyb_paper)

# Case 3: Jekyll povered website

- [This website](http://muuankarski.github.io/luntti/)
- [source](https://github.com/muuankarski/luntti)

# Case 4: FAO Statistical Pocketbook

- [source](https://github.com/UNFAOstatistics/regional15) - will be updated later today


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
##  [1] Rcpp_0.11.6      formatR_1.2      plyr_1.8.3       tools_3.2.1     
##  [5] digest_0.6.8     evaluate_0.7     gtable_0.1.2     DBI_0.3.1       
##  [9] yaml_2.1.13      parallel_3.2.1   proto_0.3-10     Rttf2pt1_1.3.3  
## [13] R6_2.0.1         reshape2_1.4.1   extrafontdb_1.0  magrittr_1.5    
## [17] scales_0.2.5     rsconnect_0.3.79 assertthat_0.1   colorspace_1.2-6
## [21] labeling_0.3     stringi_0.5-5    lazyeval_0.1.10  munsell_0.4.2
```


