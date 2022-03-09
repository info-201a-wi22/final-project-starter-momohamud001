# Bechdel <- read.csv("../data/Bechdel.csv",stringsAsFactors = FALSE)

#install.packages("plotly")
library("ggplot2")
library("dplyr")  
install.packages("gapminder")
library("gapminder")


Bechdel <- read.csv("../data/Bechdel.csv")



ratings_plots <-  Bechdel %>% 
  mutate(Decade = floor(year/10)*10) %>% 
  group_by(Decade) %>% 
  count(rating)
names(ratings_plots)[names(ratings_plots) == "n"] <- "Occurrences"
View(ratings_plots)



rating_year_plot <- ggplot(ratings_plots, aes(fill=rating, y= Occurrences, x=Decade)) +
  geom_bar(position="stack", stat="identity") +
  ggtitle("Number of Each Rating Per Decade") 

rating_year_plot




gg <- ggplot(ratings_plots, aes(Decade, Occurrences, color = rating, frame = Decade)) +
  geom_point(aes(size = Occurrences)) +
  geom_smooth(se = FALSE, method = "lm") +
  scale_x_log10()
ggplotly(gg) %>% 
  highlight("plotly_hover")


