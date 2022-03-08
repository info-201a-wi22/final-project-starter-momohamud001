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
  
    
    output$text <- renderText({
      return(paste("The binary chart shows that nowomen in movies started in 1977 but had women in movies from 1970 until 2013. Both charts show that women have been in movies but also haven't been in movies, and even if women are in the film, it isn't a guarantee that they will talk. The test chart shows that women only have two lines of passes and eight lines of fails. In both charts, you can see that there isn't enough female representation in the movie industry."))
    })
    
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

