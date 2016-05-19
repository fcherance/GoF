# global Script -----------------------------------------------------------
# Title:        ROC curve sensitivity to underlying distribution of classes
# Author:       Fabien CHERANCE
# Date:         19 May 2016
# Mantainer:    Fabien CHERANCE <fabien.cherance@gmail.com>
# Description:  Setting a variaty of spreads between a Low Propensity Class
#               and a High Propensity Class, and a variaty of imbalances
#               of the original classes. 
#               We measure the values of AUC as shortcut for the GINI
#               as sensitivities of the two parameters.
#               Predictions are the "real" propensities, the ones used to generate
#               the observations.


# Observations
N=200

# Definition of predictions
AUC_SENSI=function(x,y,N,PBL){
  
  # Real propensities of PBL: low propensity level
  F1=c(rep(PBL,y),rep(x,N-y))
  # Simulation of observations as response
  O1=(runif(N)<=F1)*1  
  
  #ROC curves and AUC 2 possible packages
    #P=ROCR::prediction(F1,O1)
    P=pROC::roc(response=O1,predictor=F1)
    #AUC_SENSI=ROCR::performance(P,"auc")@y.values
    AUC_SENSI=P$auc
}
AUC_VEC=Vectorize(AUC_SENSI)

# Values tested for the plots
SENSI_SPREAD=(1:100)*0.01
SENSI_BALANCE=(1:20)*0.05

