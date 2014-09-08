---
layout: default
title: "Pandoc"
author: "Markus Kainu"
date: "24.08.2014"
---


```r
pandoc -s -S --number-section --toc --from=markdown+yaml_metadata_block -H koko_css_mukaan.css source.md -o output.html
#
pandoc -s -S --number-section --toc --from=markdown+yaml_metadata_block --css css_mukana_hakemistossa.css source.md -o output.html
# pdf
pandoc --toc --number-section --latex-engine=xelatex -V lang=english -V papersize:a4paper -V documentclass=scrartcl input.md -o article_demokr.pdf
# word
pandoc --toc --number-section input.md -o article_demokr.docx
```



