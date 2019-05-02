intensitynorm<-function(data){
  spc<-data[, sapply(data, class) != 'factor']
  info<-data[, sapply(data, class) == 'factor']
  a<-as.data.frame(diag(1/apply(spc,1,max)) %*% as.matrix(spc))
  cbind(info,a)
    }
