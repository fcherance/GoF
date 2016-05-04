library(shiny)
library(datasets)
library(pROC)
library(ROCR)
library(ggplot2)


# Define server logic required to plot various variables against
# mpg
shinyServer(function(input, output) {
  
  # Compute the formula text in a reactive expression since it is
  # shared by the output$caption and output$mpgPlot functions
  formulaText <- reactive({
    AUC=matrix(unlist(AUC_VEC(SENSI_SPREAD,N*input$balance*0.01,5000,input$PBL*0.01)),100,1)
    GRAPH1=data.frame(xx=1:100,yy=AUC*100)
  })
  
  # Return the formula text for printing as a caption
  
  
  # Generate a plot of the requested variable against mpg and
  # only include outliers if requested
  output$Curve <- renderPlot({
    GRAPH1=formulaText()
    plot(GRAPH1$xx,GRAPH1$yy, type='l', xlab='Spread', ylab='AUC')
  })
  
})
