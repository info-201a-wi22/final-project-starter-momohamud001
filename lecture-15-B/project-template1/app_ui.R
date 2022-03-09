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
      tags$p(strong("The binary chart shows that nowomen in movies started in 1977 
                    but had women in movies from 1970 until 2013. Both charts show 
                    that women have been in movies but also haven't been in movies, 
                    and even if women are in the film, it isn't a guarantee that they 
                    will talk. The test chart shows that women only have two lines of 
                    passes and eight lines of fails. In both charts, you can see that 
                    there isn't enough female representation in the movie industry."
                    , style= "color:black")) ,
      br(),
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

