---
layout: default
title: "Webin raapimista"
author: "Markus Kainu"
date: "24.08.2014"
---




# Webin raapimista


## Wikipedia

[source](http://stackoverflow.com/questions/1395528/scraping-html-tables-into-r-data-frames-using-the-xml-package)


```r
library(XML)
theurl <- "http://en.wikipedia.org/wiki/Brazil_national_football_team"
tables <- readHTMLTable(theurl)
n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))

tables[[which.max(n.rows)]]
```

## Sekalaisia

- [Suomi24.fi by R-ohjelmointi.org](http://www.r-ohjelmointi.org/?p=1722)

