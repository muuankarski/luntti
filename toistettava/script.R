#' This is a R-script that demonstrates how to create plots and tables
#' Load the libraries first
library(knitr)
library(ggplot2)

#' Create a markdown table

kable(head(cars))

#' You can also set chunk options like this
#+ chunk-label, echo=FALSE

ggplot(cars, aes(x=speed, y=dist, color=speed)) +
  geom_point() + geom_smooth(method="loess")