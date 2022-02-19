

setwd("~/Desktop/info201/assignments/final-project-starter-momohamud001")
source("./data/Bechdel.csv")
Bechdel <- read.csv("Bechdel.csv")
getwd()
View(Bechdel)

install.packages("plotly")
library("plotly")

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