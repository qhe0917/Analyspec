library(baseline)
library(tidyverse)
baseline_corrt<-function(data, method ='modpolyfit',
                        degree = 3, tol = 0.001, rep = 100){
  spc<-data[, sapply(data, class) != 'factor']
  info<-data[, sapply(data, class) == 'factor']
  baseline <- spc %>% as.matrix() %>%
    baseline(method = method, degree = degree, tol = tol, rep = rep)
  bsl<-list(info,baseline)
}



