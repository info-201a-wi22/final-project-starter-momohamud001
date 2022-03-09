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

    
#Chart1
    
    clean_test_ranking <- movie %>%
      group_by(year) %>%
      count(clean_test)


    output$Chart1 <- renderPlotly({
      Chart1 <- clean_test_ranking  %>%
        filter(year %in% input$year_choose) %>% 
        group_by(clean_test) %>% 
        filter(clean_test %in% input$test_result) %>% 
        select(year,clean_test,n)

      Test_result <- plot_ly(Chart1, labels = ~clean_test, values = ~n, type = 'pie')
      Test_result <- Test_result %>% 
        layout(title = 'Test_result',
               xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
               yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE))
      
      return(Test_result)
    }

    )
  
    
#Chart2  
    
    output$movie <- renderPlotly({
      binary_test <- movie %>% 
        select(year, clean_test, test, binary)
      
      if (input$binary_type == "Binary")
        h <- ggplot(binary_test) + 
          geom_line(mapping =  aes(x = year, y= clean_test, colour = clean_test))+
          ggtitle("Test from (1970-2013)")
      
      else 
        
        h <- plot_ly(data = binary_test,
                     x = ~year,
                     y = ~test,
                     color = ~binary,
                     type = "scatter"
        ) %>%
          layout(title = "Fail or Pass from (1970-2013)",
                 xaxis = list(title ="Year"),
                 yaxis = list(title ="Test")
          )
      return(h)
      
    })
  
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
# filter(clean_test %in% input$test_result) %>%
