# Bechdel <- read.csv("../data/Bechdel.csv",stringsAsFactors = FALSE)

#install.packages("plotly")
library("ggplot2")
library("dplyr")  



Bechdel <- read.csv("../data/Bechdel.csv")



ratings_plots <-  Bechdel %>% 
  mutate(Decade = floor(year/10)*10) %>% 
  group_by(Decade) %>% 
  count(rating)
#View(ratings_plots)
names(ratings_plots)[names(ratings_plots) == "n"] <- "Occurrences"
#View(ratings_plots)



rating_year_plot <- ggplot(ratings_plots, aes(fill=rating, y= Occurrences, x=Decade)) +
  geom_bar(position="stack", stat="identity") +
  ggtitle("Number of Each Rating Per Decade") 

#rating_year_plot
