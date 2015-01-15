---
title: "tidyr & dplyr"
author: "Markus Kainu"
date: "14.01.2015"
layout: default
---




- [tidyr & dplyr lunttilappu](http://www.rstudio.com/wp-content/uploads/2015/01/data-wrangling-cheatsheet.pd)
- [Garrett Grolemund - Data Wrangling with R slaidit](https://dl.dropboxusercontent.com/u/5896466/wrangling-webinar.pdf)

# tidyr


```r
library(tidyr)
library(dplyr)
library(EDAWR)

cases
```

```
##   country  2011  2012  2013
## 1      FR  7000  6900  7000
## 2      DE  5800  6000  6200
## 3      US 15000 14000 13000
```

```r
gather(cases, # data
       "year", # name of the key variable
       "n", # name of valut var
       2:4) # variables NOT tidy
```

```
##   country year     n
## 1      FR 2011  7000
## 2      DE 2011  5800
## 3      US 2011 15000
## 4      FR 2012  6900
## 5      DE 2012  6000
## 6      US 2012 14000
## 7      FR 2013  7000
## 8      DE 2013  6200
## 9      US 2013 13000
```



```r
pollution
```

```
##       city  size amount
## 1 New York large     23
## 2 New York small     14
## 3   London large     22
## 4   London small     16
## 5  Beijing large    121
## 6  Beijing small     56
```

```r
spread(pollution, # data
       size, # luokka-muuttuja
       amount) # määrä
```

```
##       city large small
## 1  Beijing   121    56
## 2   London    22    16
## 3 New York    23    14
```



```r
storms
```

```
## Source: local data frame [6 x 4]
## 
##     storm wind pressure       date
## 1 Alberto  110     1007 2000-08-03
## 2    Alex   45     1009 1998-07-27
## 3 Allison   65     1005 1995-06-03
## 4     Ana   40     1013 1997-06-30
## 5  Arlene   50     1010 1999-06-11
## 6  Arthur   45     1010 1996-06-17
```

```r
storms2 <- separate(storms, date, c("year", "month", "day"), sep = "-")
storms2
```

```
## Source: local data frame [6 x 6]
## 
##     storm wind pressure year month day
## 1 Alberto  110     1007 2000    08  03
## 2    Alex   45     1009 1998    07  27
## 3 Allison   65     1005 1995    06  03
## 4     Ana   40     1013 1997    06  30
## 5  Arlene   50     1010 1999    06  11
## 6  Arthur   45     1010 1996    06  17
```

```r
unite(storms2, "date", year, month, day, sep = "-")
```

```
## Source: local data frame [6 x 4]
## 
##     storm wind pressure       date
## 1 Alberto  110     1007 2000-08-03
## 2    Alex   45     1009 1998-07-27
## 3 Allison   65     1005 1995-06-03
## 4     Ana   40     1013 1997-06-30
## 5  Arlene   50     1010 1999-06-11
## 6  Arthur   45     1010 1996-06-17
```



# dplyr



```r
library(dplyr)
library(ggplot2)
tbl_df(diamonds)
```

```
## Source: local data frame [53,940 x 10]
## 
##    carat       cut color clarity depth table price    x    y    z
## 1   0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
## 2   0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
## 3   0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
## 4   0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
## 5   0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
## 6   0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48
## 7   0.24 Very Good     I    VVS1  62.3    57   336 3.95 3.98 2.47
## 8   0.26 Very Good     H     SI1  61.9    55   337 4.07 4.11 2.53
## 9   0.22      Fair     E     VS2  65.1    61   337 3.87 3.78 2.49
## 10  0.23 Very Good     H     VS1  59.4    61   338 4.00 4.05 2.39
## ..   ...       ...   ...     ...   ...   ...   ...  ...  ...  ...
```

```r
diamonds$x %>%
  mean() %>%
  round(2)
```

```
## [1] 5.73
```

## select() - valitse rivejä


```r
storms
# puduota muuttuja
select(storms, -storm)
# valitse rivit
filter(storms, wind >= 50)
# valitse rivit - useampi ehto
filter(storms,
       wind >= 50,
       storm %in% c("Alberto", "Alex", "Allison"))
```


### Lisää select-komentoja


```r
- # Select everything but
: # Select range
contains() # Select columns whose name contains a character string
ends_with() # Select columns whose name ends with a string
everything() # Select every column
matches() # Select columns whose name matches a regular expression
num_range() # Select columns named x1, x2, x3, x4, x5
one_of() # Select columns whose names are in a group of names
starts_with() # Select columns whose name starts with a character string
```


## mutate () - Tee uusia muuttujia


```r
mutate(storms, ratio = pressure / wind)
```

```
## Source: local data frame [6 x 5]
## 
##     storm wind pressure       date     ratio
## 1 Alberto  110     1007 2000-08-03  9.154545
## 2    Alex   45     1009 1998-07-27 22.422222
## 3 Allison   65     1005 1995-06-03 15.461538
## 4     Ana   40     1013 1997-06-30 25.325000
## 5  Arlene   50     1010 1999-06-11 20.200000
## 6  Arthur   45     1010 1996-06-17 22.444444
```

```r
mutate(storms,ratio = pressure / wind,
       inverse = ratio^-1)
```

```
## Source: local data frame [6 x 6]
## 
##     storm wind pressure       date     ratio    inverse
## 1 Alberto  110     1007 2000-08-03  9.154545 0.10923535
## 2    Alex   45     1009 1998-07-27 22.422222 0.04459861
## 3 Allison   65     1005 1995-06-03 15.461538 0.06467662
## 4     Ana   40     1013 1997-06-30 25.325000 0.03948667
## 5  Arlene   50     1010 1999-06-11 20.200000 0.04950495
## 6  Arthur   45     1010 1996-06-17 22.444444 0.04455446
```

### Lisää mutate funktiooita

>All take a vector of values and return a vector of values


```r
pmin(), pmax() # Element-wise min and max
cummin(), cummax() # Cumulative min and max
cumsum(), cumprod() # Cumulative sum and product
between() # Are values between a and b?
cume_dist() # Cumulative distribution of values
cumall(), cumany() # Cumulative all and any
cummean() # Cumulative mean
lead(), lag() # Copy with values one position
ntile() #Bin vector into n buckets
dense_rank(), min_rank(), percent_rank(), row_number() # Various ranking methods
```


## summarise() - vaihda yksikköä


```r
pollution %>% 
  summarise(median = median(amount), 
            variance = var(amount))
```

```
##   median variance
## 1   22.5   1731.6
```

### Hyviä summary funktioita

> All take a vector of values and return a single value


```r
min(), max() # Minimum and maximum values
mean() # Mean value
median() # Median value
sum() # Sum of values
var, sd() # Variance and standard deviation of a vector
first() # First value in a vector
last() # Last value in a vector
nth() # Nth value in a vector
n() # The number of values in a vector
n_distinct() # The number of distinct values in a vector
```



## ryhmittäiset analyysit


```r
h <- pollution %>% group_by(city)
h
```

```
## Source: local data frame [6 x 3]
## Groups: city
## 
##       city  size amount
## 1 New York large     23
## 2 New York small     14
## 3   London large     22
## 4   London small     16
## 5  Beijing large    121
## 6  Beijing small     56
```

```r
ungroup(h)
```

```
## Source: local data frame [6 x 3]
## 
##       city  size amount
## 1 New York large     23
## 2 New York small     14
## 3   London large     22
## 4   London small     16
## 5  Beijing large    121
## 6  Beijing small     56
```



```r
pollution
```

```
##       city  size amount
## 1 New York large     23
## 2 New York small     14
## 3   London large     22
## 4   London small     16
## 5  Beijing large    121
## 6  Beijing small     56
```

```r
pollution  %>% group_by(city) %>%
  summarise(mean = mean(amount),
            sum = sum(amount),
            n = n())
```

```
## Source: local data frame [3 x 4]
## 
##       city mean sum n
## 1  Beijing 88.5 177 2
## 2   London 19.0  38 2
## 3 New York 18.5  37 2
```



```r
pollution %>% 
  group_by(city) %>% 
  summarise(mean = mean(amount), sum = sum(amount), n = n())
```

```
## Source: local data frame [3 x 4]
## 
##       city mean sum n
## 1  Beijing 88.5 177 2
## 2   London 19.0  38 2
## 3 New York 18.5  37 2
```



```r
# data(tb)
# tb %>% 
#   group_by(country, year) %>% 
#   summarise(cases = sum(cases)) %>% 
#   summarise(cases = sum(cases))

Error in FUN(X[[1L]], ...) : 
  only defined on a data frame with all numeric variable
```

## Järjestä data


```r
arrange(storms, wind)
```

```
## Source: local data frame [6 x 4]
## 
##     storm wind pressure       date
## 1     Ana   40     1013 1997-06-30
## 2    Alex   45     1009 1998-07-27
## 3  Arthur   45     1010 1996-06-17
## 4  Arlene   50     1010 1999-06-11
## 5 Allison   65     1005 1995-06-03
## 6 Alberto  110     1007 2000-08-03
```

```r
arrange(storms, -wind)
```

```
## Source: local data frame [6 x 4]
## 
##     storm wind pressure       date
## 1 Alberto  110     1007 2000-08-03
## 2 Allison   65     1005 1995-06-03
## 3  Arlene   50     1010 1999-06-11
## 4    Alex   45     1009 1998-07-27
## 5  Arthur   45     1010 1996-06-17
## 6     Ana   40     1013 1997-06-30
```

```r
arrange(storms, desc(wind), desc(date))
```

```
## Source: local data frame [6 x 4]
## 
##     storm wind pressure       date
## 1 Alberto  110     1007 2000-08-03
## 2 Allison   65     1005 1995-06-03
## 3  Arlene   50     1010 1999-06-11
## 4    Alex   45     1009 1998-07-27
## 5  Arthur   45     1010 1996-06-17
## 6     Ana   40     1013 1997-06-30
```

## the pipe operatos


```r
storms %>% 
  filter(wind >= 50) %>% 
  select(storm, pressure)
```

```
## Source: local data frame [3 x 2]
## 
##     storm pressure
## 1 Alberto     1007
## 2 Allison     1005
## 3  Arlene     1010
```

```r
pollution  %>% group_by(city) %>%
  summarise(mean = mean(amount),
            sum = sum(amount),
            n = n())
```

```
## Source: local data frame [3 x 4]
## 
##       city mean sum n
## 1  Beijing 88.5 177 2
## 2   London 19.0  38 2
## 3 New York 18.5  37 2
```

```r
storms %>% 
  mutate(ratio = pressure / wind) %>%
  select(storm, ratio)
```

```
## Source: local data frame [6 x 2]
## 
##     storm     ratio
## 1 Alberto  9.154545
## 2    Alex 22.422222
## 3 Allison 15.461538
## 4     Ana 25.325000
## 5  Arlene 20.200000
## 6  Arthur 22.444444
```

# join() - datojen yhdistäminen


```r
library(dplyr)

songs
```

```
##                  song  name
## 1 Across the Universe  John
## 2       Come Together  John
## 3      Hello, Goodbye  Paul
## 4           Peggy Sue Buddy
```

```r
artists
```

```
##     name  plays
## 1 George  sitar
## 2   John guitar
## 3   Paul   bass
## 4  Ringo  drums
```

```r
left_join(songs, artists, by = "name")
```

```
##    name                song  plays
## 1  John Across the Universe guitar
## 2  John       Come Together guitar
## 3  Paul      Hello, Goodbye   bass
## 4 Buddy           Peggy Sue   <NA>
```

```r
inner_join(songs, artists, by = "name")
```

```
##   name                song  plays
## 1 John Across the Universe guitar
## 2 John       Come Together guitar
## 3 Paul      Hello, Goodbye   bass
```

```r
#outer_join(songs, artists, by = "name")

semi_join(songs, artists, by = "name")
```

```
##                  song name
## 1 Across the Universe John
## 2       Come Together John
## 3      Hello, Goodbye Paul
```

```r
anti_join(songs, artists, by = "name")
```

```
##        song  name
## 1 Peggy Sue Buddy
```



```r
dplyr::bind_cols(x,y)
dplyr::bind_rows
dplyr::union
dplyr::intersect
dplyr::setdif
```
