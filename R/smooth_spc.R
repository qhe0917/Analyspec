smooth_spc<-function(data = NULL, points = 10){
  spc<-data[, sapply(data, class) != 'factor']
  info<-data[, sapply(data, class) == 'factor']
  smth<-function(x,points=points){
    x<-as.numeric(x)
    n<-length(x)
    smooth<-x
      for (i in 1:n) {
        if ((i - points/2) > 0 & ((i + points/2) < n)){
          smooth[i] <- mean(x[c((i - points/2):(i + points/2))])
        }
      }
    smooth
    }
      smooth<-as.data.frame(t(apply(spc,1,smth,points)))
      smt<-cbind(info,smooth)
}

