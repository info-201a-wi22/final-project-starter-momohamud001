

#install.packages("plotly")
library("plotly")


#source("/Bechdel.csv")
Bechdel <- read.csv("../data/Bechdel.csv",stringsAsFactors = FALSE)

number_of_each_rating <- Bechdel %>%
  group_by(rating) %>% 
  count()


print(number_of_each_rating)

plot_ly(
  data = number_of_each_rating ,
  x = ~rating,      
  y = ~n,        
  type = "bar",  
  alpha = .7,    
  hovertext = "y" 
) %>%
  layout(
    title = "Number of each rating",
    xaxis = list(title = "Rating"),
    yaxis = list(title = "Number of rating")
  )