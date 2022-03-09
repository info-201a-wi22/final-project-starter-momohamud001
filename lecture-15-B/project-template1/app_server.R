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
file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
file_bechdel <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/Bechdel.csv"


movie <- read.csv(file_name, stringsAsFactors = FALSE)


Bechdel <- read.csv(file_bechdel, stringsAsFactors = FALSE)

server <- function(input, output) {
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

      return(x)
<<<<<<< HEAD
    }

    )
  
    
    
    
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
=======
})
      
#Summarize Data and then Plot
ratings_plots <- Bechdel %>%
  mutate(Decade = floor(year/10)*10) %>%
  group_by(Decade) %>%
  count(rating)
>>>>>>> 9a91c14 (idk)

names(ratings_plots)[names(ratings_plots) == "n"] <- "Occurrences"

output$Chart2 <- renderPlotly({
  Chart2 <- ggplot(ratings_plots, aes(Decade, Occurrences, color = rating, frame = Decade)) +
    geom_point(aes(size = Occurrences)) +
    geom_smooth(se = FALSE, method = "lm")

  return(Chart2)
})

}
