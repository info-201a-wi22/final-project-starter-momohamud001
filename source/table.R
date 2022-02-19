#install.packages("areaplot")
library(areaplot)
library(stringr)
library(dplyr)
library(ggplot2)
#install.packages("plotly")
library(plotly)
#install.packages("knitr")
library(knitr)
library(tidyverse)
file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/Bechdel.csv"
bechdel <- read.csv(file_name, stringsAsFactors = FALSE)

file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
movie <- read.csv(file_name, stringsAsFactors = FALSE)
View(movie)
df1 <- bechdel %>%
  group_by(rating) %>%
  mutate(sum(rating)/rating) %>%
  count(rating) 
View(df1)

df2 <- movie %>% 
  select(title, test, binary, budget, domgross)


join = left_join(df2, df1,by = "title") %>% 
select(title, test, binary, budget, rating, domgross) 

col.names = c("Title", "imdb", "test", "binary", "budget", "rating", "domgross", "intgross")

col.names = c("Title", "imdb", "test", "binary", "budget", "rating", "domgross", "intgross")
#View(join)
#knitr::kable(join)


