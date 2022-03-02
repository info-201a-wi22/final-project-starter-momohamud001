library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)

library(plotly)

library(knitr)
library(tidyverse)
bechdel <- read.csv(
  "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/Bechdel.csv",
  stringsAsFactors = FALSE
  )

movie <- read.csv(
  "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv",
 stringsAsFactors = FALSE)
View(movie)


binary_test <- movie %>% 
  group_by(year) %>% 
  select(year, test)
#View(binary_test)

#Chart

a <- plot_ly(data = binary_test,
             x = ~year,
             y = ~test,
             color = ~year,
             type = "scatter"
) %>%
  layout(title = "Test from (1970-2013)",
         xaxis = list(title ="Year"),
         yaxis = list(title ="Test"))
a
