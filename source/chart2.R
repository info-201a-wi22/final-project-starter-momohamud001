#install.packages("plotly")
library("plotly")
library("ggplot2")
library("dplyr")
movies <- read.csv("movies.csv")
clean_test_ranking <- movies %>%
  group_by(clean_test) %>%
  count()

print(clean_test_ranking)
ggplot(clean_test_ranking) +
  geom_point(mapping = aes(x = clean_test_ranking, y = n))
