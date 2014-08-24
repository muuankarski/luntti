##

library(knitr)

dirlist <- c("R/","julkaisu/","toistettava/","versio/")

for (dir in dirlist) {
  files <- list.files(dir, pattern=".Rmd")
  files <- gsub(".Rmd","",files)
  for (i in files) {
    knit(paste0(dir,paste0(i,".Rmd")),
                paste0(dir,paste0(i,".md")))
  }  
}

