library("ggplot2")
library("dplyr")
movies <- read.csv("movies.csv")
clean_test_ranking <- movies %>%
  group_by(clean_test) %>%
  count()

names(clean_test_ranking)[names(clean_test_ranking) == "n"] <- "ranking"
x <- ggplot(data =clean_test_ranking, aes(x = "", y = ranking, fill = clean_test)) + 
     geom_bar(stat = "identity") + 
     coord_polar("y")+ 
  ggtitle("Gender equality in moives")
x
