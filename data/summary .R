# setwd("~/Desktop/info201/assignments/final-project-starter-momohamud001")

Bechdel <- read.csv("Bechdel.csv",stringsAsFactors = FALSE)

knitr::kable(summary_info)
print(mean_of_data)

nineteenth_century <- Bechdel   %>% 
  filter(year >="1800",year <= "1899") %>%
  pull(rating)
avg_rating_19 <- mean(nineteenth_century, na.rm = TRUE) 
print(avg_rating_19)

twentyth_century <- Bechdel %>% 
  filter(year >="1900",year <= "1999") %>%
  pull(rating)
avg_rating_20 <- mean(twentyth_century, na.rm = TRUE) 
print(avg_rating_20)

century_21 <- Bechdel %>% 
  filter(year >="2000",year <= "2022") %>%
  pull(rating)
avg_21 <- mean(century_21, na.rm = TRUE) 
print(avg_21)

median_during_19th<-  Bechdel %>% 
  filter(year >="1800",year <= "1899") %>% 
  pull(rating) 
median_in_19th <- median(median_during_19th)


median_during_20th<-  Bechdel %>% 
  filter(year >="1900",year <= "1999") %>% 
  pull(rating) 
median_in_20_th <- median(median_during_20th)

summary_info <- list(
  " Average for 18th century to 19th century" = avg_rating_19 ,
  " Average for 19th century to 20th century" =  avg_rating_20,
  " Average in the 21st century" = avg_21,
  "Median in 19th Century" = median_in_19th ,
  "Median in 19th Century" = median_during_20th, 

)
