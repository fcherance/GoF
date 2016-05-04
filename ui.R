library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("AUC Sensitivity"),
  
  # Sidebar with controls to select the variable to plot against
  # mpg and to specify whether outliers should be included
  sidebarLayout(
    sidebarPanel(
      sliderInput("balance",
                  "Proportion of Low Probability level:",
                  min = 1,  max = 100, value = 15),
      sliderInput("PBL",
                  "Low Probability level:",
                  min = 1,  max = 100,  value = 10)
    ),
  
    
    # Show the caption and plot of the requested variable against
    # mpg
    mainPanel(
      plotOutput("Curve")
    )
  )
))
