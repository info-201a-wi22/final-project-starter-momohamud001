library("shiny")
library("dplyr")
library("ggplot2")
server <- function(input, output) {
  
  
  Bechdel <- read.csv("../data/Bechdel.csv")
  
  #Summarize Data and then Plot
  ratings_plots <- Bechdel %>% 
    mutate(Decade = floor(year/10)*10) %>% 
    group_by(Decade) %>% 
    count(rating)
  names(ratings_plots)[names(ratings_plots) == "n"] <- "Occurrences"
  }
  
  #Plot 
  output$plot <-renderPlot({ ggplot(ratings_plots, aes(Decade, Occurrences, color = rating, frame = Decade)) +
    geom_point(aes(size = Occurrences)) +
    geom_smooth(se = FALSE, method = "lm") +
    scale_x_log10()
  ggplotly(gg) %>% 
    highlight("plotly_hover")
})

ui <- basicPage(
  h1("R Shiny interactive Bar Chart using Reactive and Render"),
  selectInput(inputId = "year",
              label = "Choose Year"),
  plotOutput("plot")
)

shinyApp(ui = ui, server = server)

