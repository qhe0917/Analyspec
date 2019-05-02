##'
##' @param path
##' @param  type join type
library(tidyverse)

readfiles<- function(path = getwd(),type = "inner"){
  pathnow<-getwd()
  getnm <- list.files(path = path)
  # do.call (do this,to this, in this way)
  setwd(path)
  spc<- getnm %>% lapply(read.csv, header = FALSE,col.names = c("wtno","int"))%>%
    join_all(by="wtno",type = "inner")
  setwd(pathnow)
  spc
}



