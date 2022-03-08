#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("dplyr")
library("tidyverse")
library("stringr")
library("plotly")
library("shinyWidgets")

first_page <- tabPanel(
  h4("page 1")
)

second_page <- tabPanel(
h4("second page"),
sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "test_result",
      label = "Pick the year",
      choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                     "dubious"= "dubious","nowomen" = "nowomen"),
      multiple = TRUE,
      selected = "men"
      # label = "choose a result to display",
      # choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
      #                "dubious"= "dubious","nowomen" = "nowomen",
      #                multiple = TRUE,
      #                selected = "men")
    ),
    selectInput(
      inputId = "year_choose",
      label = "Pick the year",
      choices = list("2013"="2013","2012"="2012","2011"="2011","2010"="2010","2009"="200"),
      multiple = TRUE,
      selected = "2013"
    )
  ),
  mainPanel(
    plotlyOutput(outputId = "Chart1")
  )
)
)
third_page <- tabPanel(
  h4("Chart3"),
  p("Charts"),
  
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "binary_type",
        label = "Pick a chart",
        choices = c("Binary", "Test"),
        
      ) 
    ),
    mainPanel(
      h3("Chart"),
      plotlyOutput(outputId = "movie"),
      textOutput("text"),   
 )
  )
)
# forth_page <- tabPanel(
#   
# )
# fith_page <- tabPanel(
#   
# )
ui <- navbarPage(
  tags$title("movie project"),
 first_page,
 second_page, 
 third_page
)

