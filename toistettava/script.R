#' This is a R-script that demonstrates how to create plots and tables
#' Load the libraries first
library(knitr)

#' Create a plot

plot(cars)

#' Create a markdown table
#' 

kable(head(cars))