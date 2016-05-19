# Server Script -----------------------------------------------------------
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


#Load the libraris
list.of.packages <- c("shiny", "pROC","ROCR","ggplot2","datasets")
#new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
#if(length(new.packages)) install.packages(new.packages)
lapply(list.of.packages, require, character.only = TRUE)


# Define server logic required to plot various variables against
shinyServer(function(input, output) {
  
  #Reactivity to Spread / parameterizing the Low Propensity level and the balance of classes
  formulaText <- reactive({
    AUC=matrix(unlist(AUC_VEC(SENSI_SPREAD,N*input$balance*0.01,5000,input$PBL*0.01)),100,1)
    GRAPH1=data.frame(xx=1:100,yy=AUC*100)
  })

  # Generate a plot of the requested
  output$Curve <- renderPlot({
    GRAPH1=formulaText()
    plot(GRAPH1$xx,GRAPH1$yy, type='l', xlab='Spread', ylab='AUC')
  })
  
})
