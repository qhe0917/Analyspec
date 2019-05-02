###function for batch processing
#read, assign info, baseline correction.
pack<-function(path=NULL,info="sample",sep ="[:punct:]",degree = degree){
  spec<-readfiles(path)
  wtno<-spec$wtno
  info<-getinfo(path,c(info,sep = sep))
  spc<- spec %>%t() %>% as.data.frame() %>%
    set_names(.[1,]) %>% slice(-1)
  fulldfW <- cbind(info,spc)
  smt<-smooth_spc(fulldfW,10)
  spc_bsl<- baseline_corrt(smt, method ='modpolyfit',degree = 12, tol = 0.001, rep = 100)
  sp_bsl<-cbind(spc_bsl[[1]],spc_bsl[[2]]@corrected) %>% as.data.frame()
  colnames(sp_bsl)<-c(colnames(info),colnames(spc))
  list(spc,info,wtno,fulldfW,smt,sp_bsl)
}
