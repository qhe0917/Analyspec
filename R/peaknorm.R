peaknorm<-function(data,wtno=c(100,200)){
  spc<-data[, sapply(data, class) != 'factor']
  info<-data[, sapply(data, class) == 'factor']
  range<-c(
    sum(as.numeric(colnames(spc))<=wtno[1]),
    sum(as.numeric(colnames(spc))<=wtno[2])
    )
  a<-as.data.frame(diag(1/apply(spc[,range],1,sum)) %*% as.matrix(spc))
  cbind(info,a)
}

