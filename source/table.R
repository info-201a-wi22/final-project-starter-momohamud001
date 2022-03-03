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
# file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/Bechdel.csv"
# bechdel <- read.csv(file_name, stringsAsFactors = FALSE)

#file_name <- "https://raw.githubusercontent.com/info-201a-wi22/final-project-starter-momohamud001/main/data/movies.csv"
#movie <- read.csv(file_name, stringsAsFactors = FALSE)

bechdel <- read.csv("../data/Bechdel.csv", stringsAsFactors = FALSE)
movie <- read.csv("../data/movies.csv", stringsAsFactors = FALSE)

#View(movie)
df1 <- bechdel %>%
  mutate(decade= floor(year/10)*10)%>% 
  group_by(decade) %>% 
  count(rating)
names(df1)[names(df1) == "n"] <- "Number of ratings"


df2 <- movie %>% 
  mutate(decade= floor(year/10)*10) %>% 
  group_by(decade) %>% 
  count(clean_test) 
names(df2)[names(df2) == "n"] <- "Number of clean test"

#View(df2)

join=left_join(df2, df1, by = "decade") %>% 

#View(join)

  #group_by(rating) %>%
  mutate(sum(rating)/rating) %>%
  count(rating) 
#View(df1)

df3 <- movie %>% 
  select(title, test, binary, budget, domgross)


# join = left_join(df2, df1,by = "title") %>% 
# select(title, test, binary, budget, rating, domgross) 

col.names = c("Title", "imdb", "test", "binary", "budget", "rating", "domgross", "intgross")

#col.names = c("Title", "imdb", "test", "binary", "budget", "rating", "domgross", "intgross")
#View(join)
knitr::kable(join)


