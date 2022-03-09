#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library("dplyr")
library("tidyverse")
library("stringr")
library("plotly")
library("shinyWidgets")
library("markdown")
library(knitr)

first_page <- tabPanel(
  h4("Introduction"),
  titlePanel("Introduction"),
  p("What is your favorite movie? Have you ever observed the role of women (or if there are any!) in the film? This report will walk you through how and what to consider when viewing your next movie
    through the lens of the Bechdel Test. As we know, patriarchy, gender stereotypes, and discrimination against women plague our society to this day. Media, such as the content being mass produced through
    the film industry, plays an enormous role in all of our lives because films are a critical part in our culture. They reflect, give feedback on, and endorse social norms that are sustained by supply,
    demand, and behavior of that people that consume the media. As you go through this report and learn how the Bechdel Test can be used as a way to study the patterns of misrepresentation of females in the
    movie industry, think about how you too, can be a more active and cognizant viewer of your next films!"),
  img(src = "BechdelTest.png", width = "1500", height = "600", alt = "Bechdel Test 3 Criteria"))
  
second_page <- tabPanel(
h4("Chart 1"),
setBackgroundColor(
  color = c("#F7FBFF", "#2171B5"),
  gradient = "linear",
  direction = "bottom"
),
sidebarLayout(
   sidebarPanel(
    selectInput(
      inputId = "test_result",
      label = "Pick the test reslut",
      choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                     "dubious"= "dubious","nowomen" = "nowomen"),
      multiple = TRUE,
      selected = "men"
    ),
    selectInput(
      inputId = "year_choose",
      label = "Pick the year",
      choices = list("2013"="2013","1970"="1970","1971"="1971","1990"="1990","2000"="2000"
                     ,"2005"="2005","2010"="2010"),
      multiple = FALSE,


      selected = "2013"
    )
  ),
  mainPanel(
    h2("Gender equality over the years",style = "color:red"),
    tags$p(em(strong("This interative chart displays the test results of the countries
                 selected. The area occupied form each reslut repersent how much each test appeared compared to 
                 other resluts. the legend on the side color codes each result displayed. Additionally the year 
                 choosen by the user is what year the chart is pulling from", style = "color:black"))),
    plotlyOutput(outputId = "Chart1")
  )
)
)


third_page <- tabPanel(
  h4("Chart 2"),
  p("Charts"),
  
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "binary_type",
        label = "Pick a chart",
        choices = c("Binary", "Test"),
        
      ) 
    ),
    mainPanel(
      h3("Binary vs Test", style = "color:red"),
      plotlyOutput(outputId = "movie"),
      br(),
      tags$p(strong("The binary chart shows that nowomen in movies started in 1977 
                    but had women in movies from 1970 until 2013. Both charts show 
                    that women have been in movies but also haven't been in movies, 
                    and even if women are in the film, it isn't a guarantee that they 
                    will talk. The test chart shows that women only have two lines of 
                    passes and eight lines of fails. In both charts, you can see that 
                    there isn't enough female representation in the movie industry."
                    , style= "color:black")) ,
      br(),
 )
  )
)



 fourth_page <- tabPanel( 
   h4("Chart 3"), 
   titlePanel("Ratings Over The Decades"), 
       plotlyOutput(outputId = "Chart2"),
       tags$p(strong("This chart will show the changes in ratings over the years. Starting from 1870 to 2020 
       As you move the slider you will be able to see that one, the number of occurrences goes up and we get introduced 
       to new ratings such as the lighter blue which is equivalent to rating 3. That represents the advancemnets that the 
       industry has made." , style = "color:black", style = "font-size:30px;"))
)

fifth_page <- tabPanel(
  h4("Summary"),
  titlePanel("3 Main Take aways"),
  tags$ol(
    tags$li("From our data, women have been in movies from 1874 to 2021, which has slowly 
    increased over the years. 
    The rating shows that after 2000 it had a drastic 
    increase",style = "font-size:30px;"),
    br(),
    tags$li("In films the fail or pass, the women's only had two passing lines from 
    1970 to 2013, but the men had eight lines.",style = "font-size:30px;"),
    br(),
    tags$li("Overall our data show that women are 
    being represented more and given more opportunities but not as many as men, but 
    it's getting better.",style = "font-size:30px;" )
    ),
  img(src = "black-panther.jpg", width = "1500", height = "600", alt = "Bechdel Test 3 Criteria")
  )
  




sixth_page <- tabPanel(
  h4("Report"),
  uiOutput('markdown')
  )
  


ui <- navbarPage(
  tags$title("movie project"),
 first_page,
 second_page, 
 third_page,
 fourth_page,
 fifth_page,
 sixth_page
 )


