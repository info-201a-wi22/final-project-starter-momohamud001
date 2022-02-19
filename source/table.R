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
View(bechdel)

file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
movie <- read.csv(file_name, stringsAsFactors = FALSE)
View(movie)



df1 <- bechdel %>%
  slice(year == year > 1900) %>%
  select(title, year, rating, imdbid)
View(na.omit(df1))


df2 <- movie %>% 
select(title, imdb, clean_test, binary, budget, domgross, intgross)

View(df2)

join=left_join(df2, df1,by = "title") %>% 
select(title, imdb, test, binary, budget, rating, domgross, intgross) 
col.names = c("Title", "imdb", "test", "binary", "budget", "rating", "domgross", "intgross")
View(na.omit(join))


