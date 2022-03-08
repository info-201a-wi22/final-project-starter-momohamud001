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
      choices = list("2013"="2013","2012"="2012","2011"="2011","2010"="2010","2009"="2009"),
      multiple = TRUE,
      selected = "2013"
    )
  ),
  mainPanel(
    plotlyOutput(outputId = "Chart1")
  )
)
)
<<<<<<< HEAD
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
      h3("Chart", style = "color:red"),
      plotlyOutput(outputId = "movie"),
      br(),
      tags$p(strong("The binary chart shows that nowomen in movies started in 1977 but had women in movies from 1970 until 2013. Both charts show that women have been in movies but also haven't been in movies, and even if women are in the film, it isn't a guarantee that they will talk. The test chart shows that women only have two lines of passes and eight lines of fails. In both charts, you can see that there isn't enough female representation in the movie industry."
                    , style= "color:black")) ,
      br(),
 )
  )
)
=======
 third_page <- tabPanel( 
   h4("Third Page"), 
   titlePanel("Ratings Over The Decades"), 
       plotlyOutput(outputId = "Chart2"),
       p("This chart will show the changes in ratings over the years. Starting from 1870 to 2020 
       As you move the slider you will be able to see that one, the number of occurrences goes up and we get introduced 
       to new ratings such as the lighter blue which is equivalent to rating 3. That represents the advancemnets that the 
       industry has made." , style = "color:black")
)



>>>>>>> 9a91c14 (idk)
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

