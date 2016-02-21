
library(knitr)

rmds <- list.files(path="./", pattern = ".Rmd")
rmds <- gsub(pattern = ".Rmd", replacement = "", x = rmds)

for (i in rmds){
  knit(paste0(i,".Rmd"),
       paste0(i,".md"))  
}

system("jekyll build")

system("rsync -arv  ~/btsync/mk/workspace/luntti/_site/ muuankarski@kapsi.fi:sites/muuankarski.kapsi.fi/www/luntti/")
  


# for (dir in dirlist) {
#   files <- list.files(dir, pattern=".Rmd")
#   files <- gsub(".Rmd","",files)
#   for (i in files) {
#     knit(paste0(dir,paste0(i,".Rmd")),
#          paste0(dir,paste0(i,".md")))
#   }
#   # Kopioidaan kuvat kuhunkin kansioon (knitr hakki)
#   from = "figure"
#   to = paste0(dir,"figure")
#   dir.create(to, recursive = TRUE)
#   file.copy(list.files(from, full.names = T), to, recursive = TRUE)
# }


# dirlist <- c("R/","julkaisu/","toistettava/","atk/","misc/")
# 
# for (dir in dirlist) {
#   files <- list.files(dir, pattern=".Rmd")
#   files <- gsub(".Rmd","",files)
#   for (i in files) {
#     knit(paste0(dir,paste0(i,".Rmd")),
#                 paste0(dir,paste0(i,".md")))
#   }
#   # Kopioidaan kuvat kuhunkin kansioon (knitr hakki)
#   from = "figure"
#   to = paste0(dir,"figure")
#   dir.create(to, recursive = TRUE)
#   file.copy(list.files(from, full.names = T), to, recursive = TRUE)
# }

# git add .
# git commit -am "new updates"
# git push

