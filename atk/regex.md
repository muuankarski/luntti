---
layout: default
title: "Regular expressions"
author: "Markus Kainu"
date: "25.06.2015"
---



# Regular expressions

## Online 
- <https://regex101.com/>

## Sed

>sed (stream editor) is a Unix utility that parses and transforms text, using a simple, compact programming language. sed was developed from 1973 to 1974 by Lee E. McMahon of Bell Labs,[1] and is available today for most operating systems

- <http://www.grymoire.com/Unix/Sed.html>
- <https://www.gnu.org/software/sed/manual/sed.html>


```r
# add characters on the same line starting with "\owner"
sed -i '/^\\owner/ s/$/ }\n\\end{metadata}\n\n\\begin{metadata}{/' filex.txt
```
