##'
##' @param path path to folder with files
##' @param groups groups in the files names
##' @param sep string used to seperate the groups
##' @examples
##' sep = "[:punct:]"
##' groups<-c("substrate","nanoparticels","enzyme","sample")
##' info<-getinfo(path=path,groups =groups, sep = sep)
##'

library(stringr)
#when names have the same format, seperated by the same character, this function can be used to quickly transfer names into colums.
getinfo<- function (path = getwd() ,groups = NULL, sep = "[:punct:]"){
  path=path
  pathnow<-getwd()
  getnm <- list.files(path = path)
  info<-getnm %>% str_sub(end=-5) %>%
    str_split_fixed(pattern=sep,n=length(groups)) %>%
    as.data.frame() %>%
    set_names(groups)
}

