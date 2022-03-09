library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
library(plotly)
library(knitr)
library(tidyverse)
# file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/Bechdel.csv"
# bechdel <- read.csv(file_name, stringsAsFactors = FALSE)

file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
movie <- read.csv(file_name, stringsAsFactors = FALSE)


binary_test <- movie %>% 
  group_by(year) %>% 
  select(year, test, binary)
#View(binary_test)

#Chart

a <- plot_ly(data = binary_test,
             x = ~year,
             y = ~test,
             color = ~binary,
             type = "scatter"
) %>%
  layout(title = "Test from (1970-2013)",
         xaxis = list(title ="Year"),
         yaxis = list(title ="Test"))
a
