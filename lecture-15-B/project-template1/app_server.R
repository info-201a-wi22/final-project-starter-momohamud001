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

server <- function(input, output) {
    file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
    movie <- read.csv(file_name, stringsAsFactors = FALSE)

    clean_test_ranking <- movie %>%
      group_by(year) %>%
      count(clean_test)


    output$Chart1 <- renderPlotly({
      Chart1 <- clean_test_ranking  %>%
        filter(year %in% input$year_choose) %>%
        filter(clean_test %in% input$test_result) %>%
        drop_na()
      
      x <- ggplot(data = Chart1 )+
        geom_col(mapping = aes(x=year,y=clean_test))

      # x <- plot_ly(clean_test_ranking, labels = ~clean_test, values = ~year, type = 'pie')
      # x <- x %>%
      #   layout(title = 'Test results',
      #          xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
      #          yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))

      return(x)
    }

    )
  
}



# file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
# movie <- read.csv(file_name, stringsAsFactors = FALSE)
# View(movie)
# 
# clean_test_ranking <- movie %>%
#   group_by(year) %>%
#   count(clean_test)
# View(clean_test_ranking)
# 
# output$Chart <- renderPlotly({
#   Chart1 <- clean_test_ranking  %>%
#     filter(year %in% input$year_choose) %>% 
#     filter(clean_test %in% input$test_result) %>% 
#     drop_na()
#     
#     x <- plot_ly(clean_test_ranking, labels = ~clean_test, values = ~year, type = 'pie')
#     x <- x %>% 
#       layout(title = 'Test results',
#              xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
#              yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
#     
#     return(x)
#   }
#   
#   )

