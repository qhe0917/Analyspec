##' more arguments pass to function pairwise.t.test()
##'
library(stats)
ttest<-function(data,groups){
  spc<-data[, sapply(data, class) != 'factor']
  info<-data[, sapply(data, class) == 'factor']
  a<-data %>% unite(group,groups,sep="_") %>% as.factor()

  b<-apply(a,2,pairwise.t.test,a$group, paire = TRUE)
}
