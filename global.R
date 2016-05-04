AUC_SENSI=function(x,y,N,PBL){
  
  F1=c(rep(PBL,y),rep(x,N-y))
  O1=(runif(N)<=F1)*1  
  P=prediction(F1,O1)
  AUC_SENSI=performance(P,"auc")@y.values
}

AUC_VEC=Vectorize(AUC_SENSI)

SENSI_SPREAD=(1:100)*0.01
SENSI_BALANCE=(1:20)*0.05
