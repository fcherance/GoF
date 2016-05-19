# User Interface Script -----------------------------------------------------------
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
  
    # Show the caption and plot
    mainPanel(
      plotOutput("Curve")
    )
  )
))