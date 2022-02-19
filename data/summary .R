# setwd("~/Desktop/info201/assignments/final-project-starter-momohamud001")


setwd("~/Desktop/info201/assignments/final-project-starter-momohamud001/")

setwd("~/Desktop/info201/assignments/final-project-starter-momohamud001/data")

source("./data/Bechdel.csv")
source("/Bechdel.csv")
Bechdel <- read.csv("Bechdel.csv",stringsAsFactors = FALSE)

View(Bechdel)

summary_info <- list()
summary_info$num_observations <- nrow(Bechdel)
summary_info$max_value <-Bechdel %>%
  filter(rating == max(rating, na.rm = T)) %>%
  select(rating)
summary_info$min_value <- Bechdel %>%
  filter(rating == min(rating, na.rm = T)) %>%
  select(rating)
summary_info$mean_of_data <- rowMeans(Bechdel[c(5)])
  
summary_info$number_of_0_ratings <- length(which(Bechdel == 0))   
summary_info$number_of_1_ratings <- length(which(Bechdel == 1)) 
summary_info$number_of_2_ratings <- length(which(Bechdel == 2))
summary_info$number_of_3_ratings <- length(which(Bechdel == 3)) 

knitr::kable(summary_info)
print(mean_of_data)

