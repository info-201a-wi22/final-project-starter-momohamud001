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
      label = "Pick the test reslut",
      choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                     "dubious"= "dubious","nowomen" = "nowomen"),
      multiple = TRUE,
      selected = "men"
    ),
    selectInput(
      inputId = "year_choose",
      label = "Pick the year",
      choices = list("2013"="2013","1970"="1970","1971"="1971","1990"="1990","2000"="2000"
                     ,"2005"="2005","2010"="2010"),
      multiple = FALSE,
      selected = "2013"
    )
  ),
  mainPanel(
    h2("Gender equality over the years"),
    p("This interative chart displays the test results of the countries
                 selected. The area occupied form each reslut repersent how much each test appeared compared to 
                 other resluts. the legend on the side color codes each result displayed. Additionally the year 
                 choosen by the user is what year the chart is pulling from"),
    plotlyOutput(outputId = "Chart1")
  )
)
)

# third_page <- tabPanel(
#   
# )
# forth_page <- tabPanel(
#   
# )
# fith_page <- tabPanel(
#   
# )
ui <- navbarPage(
  tags$title("movie project"),
 first_page,
 second_page
)

