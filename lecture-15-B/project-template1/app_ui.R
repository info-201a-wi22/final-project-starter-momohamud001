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

first_page <- tabPanel(
  h4("page 1"),
  titlePanel("Introduction"),
  p("What is your favorite movie? Have you ever observed the role of women (or if there are any!) in the film? This report will walk you through how and what to consider when viewing your next movie
    through the lens of the Bechdel Test. As we know, patriarchy, gender stereotypes, and discrimination against women plague our society to this day. Media, such as the content being mass produced through
    the film industry, plays an enormous role in all of our lives because films are a critical part in our culture. They reflect, give feedback on, and endorse social norms that are sustained by supply,
    demand, and behavior of that people that consume the media. As you go through this report and learn how the Bechdel Test can be used as a way to study the patterns of misrepresentation of females in the
    movie industry, think about how you too, can be a more active and cognizant viewer of your next films!"))
<img src = "BechdelTest.png", width = "500", height = "600", alt = "Bechdel Test 3 Criteria">
  
second_page <- tabPanel(
h4("second page"),
sidebarLayout(
  sidebarPanel(
    selectInput(
      inputId = "test_result",
      label = "Pick the year",
      choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                     "dubious"= "dubious","nowomen" = "nowomen"),
      multiple = TRUE,
      selected = "men"
      # label = "choose a result to display",
      # choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
      #                "dubious"= "dubious","nowomen" = "nowomen",
      #                multiple = TRUE,
      #                selected = "men")
    ),
    selectInput(
      inputId = "year_choose",
      label = "Pick the year",
      choices = list("2013"="2013","2012"="2012","2011"="2011","2010"="2010","2009"="2009"),
      multiple = TRUE,
      selected = "2013"
    )
  ),
  mainPanel(
    plotlyOutput(outputId = "Chart1")
  )
)
)
third_page <- tabPanel(
  h4("Chart3"),
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
      h3("Chart", style = "color:red"),
      plotlyOutput(outputId = "movie"),
      br(),
      tags$p(strong("The binary chart shows that nowomen in movies started in 1977 but had women in movies from 1970 until 2013. Both charts show that women have been in movies but also haven't been in movies, and even if women are in the film, it isn't a guarantee that they will talk. The test chart shows that women only have two lines of passes and eight lines of fails. In both charts, you can see that there isn't enough female representation in the movie industry."
                    , style= "color:black")) ,
      br(),
 )
  )
)
 fourth_page <- tabPanel( 
   h4("Fourth Page"), 
   titlePanel("Ratings Over The Decades"), 
       plotlyOutput(outputId = "Chart2"),
       p("This chart will show the changes in ratings over the years. Starting from 1870 to 2020 
       As you move the slider you will be able to see that one, the number of occurrences goes up and we get introduced 
       to new ratings such as the lighter blue which is equivalent to rating 3. That represents the advancemnets that the 
       industry has made." , style = "color:black")
)




# forth_page <- tabPanel(
#   
# )
fith_page <- tabPanel("Report", verbatimTextOutput("Report"),
  titlePanel("Female Representation on the Big Screen"),
  p("Authors: Mohamed Mohamoud, Jaya Valji, Angela Gaither, Fatima Dineh, Jainaba Jawara"),
  p("Affiliation: INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
  p("Date: Winter 2022"),
  p("Abstract: This project examines the (under/mis) representation of female actors in the movie industry. Using the Bechdel Test, we observe the trends between how profitable a movie is depending on its Bechdel Test score, which of the three test requirements have the highest number of failed results, and how Bechdel Test scores have changed between 1950-2021.
    This topic is important because media plays a substantial role in creating and upholding gender norms that get translated into stereotypes embedded in our daily culture. Once these areas have been studied, we can apply it to larger questions begging critical thinking such as how stereotypes of women in films effect their ability to attain key roles."),
  p("Keywords: Representation, Women, Bechdel Test, Movies"),
  p("Introduction: Female Representation on the Big Screen is centered around the idea that female actors are not given equal representation on screen in films. Our aim is to use the Bechdel Test as a way to study the patterns of misrepresentation of females in the movie industry. Created by Alison Bechdel in 1985, the Bechdel Test is still relevant today and measures representation by checking three criteria:

The movie must have at least 2 [named] female characters
Who talk to each other
About something other than a man. In Hollywood, for example, the majority of A-list actors, directors, and writers are men. This has led to their biases of women tainting the film industry and affecting broader issues such as unequal pay, key roles, and the reinforcement of stereotypes. We all have our favourite female actors or even directors, 
    but few people are aware of the lack of credit they receive and the major waste of potential simply due to Hollywood patriarchy."),
  p("Design Situation: "),
  p("Project Framing: The social issue this project aims to address is sexism, specifically when it comes to women in films. Sexism is portrayed through misrepresentation of women where stereotypes are maintained through continuous casting, directing, and script patterns. The project uses the Bechdel Test as a means of measuring the lack of 
    representation and showing its changes over the decades. The project highlights how sexism is structural, and embedded within society through media and the capitalistic economy."),
  p("Human Values: The human values connected to this project include equality and equity when it comes to gender representation and treatment. Equality refers to all individuals receiving the same resources in same number, whereas equity refers to when specific circumstances of the individuals are considered and resources are allocated based on need.
  When it comes to finding a solution to the problem of women's representation, it is important increasingly make opportunities for women the same as men (equality), but also go one step further and think about how these opportunities can be efficiently given by effectively focusing on the interests of women first, not men and women together."),
  p("Direct and Indirect Stakeholders: The direct stakeholders are the women in Hollywood who are being taken advantage of in all regards by men in power. From all levels in film-making, women of all skills and backgrounds are unfairly represented both economically (if they do not get prominent roles their pay is naturally lessened) as well as being attached to stereotypes that continue gendered ideas of women.
    The indirect stakeholders in our research would be movie goers and the public who subconsciously make assumptions about women and perpetuate stereotypes in their mind based on the film media they consume. Ultimately, this project and the issue it is addressing can only benefit society as a whole."),
  p("Harms and Benefits: The benefits of this research will be that we will be able to see the inequality in the movie industry in data. It is easy to say that women are being discriminated against, but now there is data compiled to show hard evidence. Possible harm may come from male co-star frustration or conflict over who will be paid less or more. This harm is unimportant however, and ultimately there are no relavent harms that could come from gender equity."),
  p("Research Questions: 	 
<<<<<<< HEAD
=======
Which of the three test requirements have the highest number of failed results?
>>>>>>> a340031f46a969fca0893a299dd73b8da7016e8c
How have Bechdel Test scores changed between 1874-2021?
How profitable is a movie depending on its Bechdel Test score?"),
  p("Application and Critical Thinking: How do stereotypes of women in films affect their ability to attain key roles?
This question is important because of the long standing belief that women cant be the star of movies unless there's a romantic element or that they have to be the ones being saved. This has long standing effects to young women that grow up thinking that it is all they will ever be. This also has effects on how directors and writers are picked as well as how much women are paid compared to their male counterparts."),
  p("The Dataset: We used the Bechdel test for our data, and the Bechdel test measures the representation of women in fiction. The Bechdel test has three rules: that at least two women are featured, that these women talk to each other, and that they discuss something other than a man. We found an article that used the Bechdel test in female representation in movies, and they gave the article rates in order to figure out the female representation. 
The score could be one of three meanings: a rating of zero means the movie does not have at least two female presentations. a rating of one, it means that the film has two female actors, but they don't talk to each other.
If it has a rating of two, the movie has two female actors, but they talk about men. If they have a three rating, they have two female actors, and they speak to each other and something other than men. We compared about 937 movies, and in our data, we broke it down by title, imdbid, id, rating, and year. If you go to the ratings, you will see which movies passed the Bechdel test and which movies failed the Bechdel test. One of the movies from 2021, called Black Widow, was based on a female superhero and passed the Bechdel test with a three, another movie, Men in Black: International,
was based on two male characters, but they still passed the Bechdel test. Another trend we saw was that there is no evident link between a film's budget or income and its Bechdel score.thus, we came to the conclusion that the Bechdel test is not always the greatest way to assess female representation in films. The movie set is our secondary source which is 1794 rows long and 15 column wide and covers a variety of topics such as budget and gross box office sales to women satisfactory role playing in movies. The who in this data set would be the women who played roles in these movies or not.
Some observations I have made with this data is that the connections between the budget and the women's roles in movies and that is something we can really dive into to find how severe the difference is between the budget of movies with men main actors or women."),
p("Expected Implications: Our findings have the expected implication that women are still barred from high positions in the media and entertainment industries. This report could be a useful tool for those learning film production and directing or for the general public to be aware of the biases we still have regarding women. This research also has far-reaching implications beyond the film business. The study of historical patterns of female representation is, in and of itself, a very important and relevent subject of research.
Our hypothesis is that our studies on films will provide substantial new insights into just how much women are under-represented in many other areas such as STEM, sports, marketing tactics, etc.

Limitations: Some limitations that come with this project are the availability and locations of data, and the continuation of movie sagas. Some movies from our Bechdel data are from countries outside of North America, and thus the differences in gender norms and culture must be acknowledged. However, the values behind our project remain - female characters on-screen can be much more than just a love interest or a shallow, supporting character to a male lead and can increased dynamic representation can positively impact female viewers.
  Furthermore, movies that continue into sagas - like Twilight - can increase data that may pass or fail the Bechdel test and therefore potentially alter the comprehensive, bigger picture. This could be controlled if sagas were reduced to their title films, though this would also disqualify a saga and our data from representing any female character arcs, development, or decreased Bechdel passability like Pirates of the Caribbean."),
p("Findings: Unlike our prediction that the most popular films that did not pass the Bechdel Test would have the higher profit, we found no obvious correlation between profitability and Bechdel Test Score. Many popular films that passed the Bechdel Test were highly profitable and some were also not. For example, Cloudy with a Chance of Meatballs 2 FAILED and had a profit of $78000000 and Despicable Me 2 PASSED with a similar profit of $76000000.
  The test requirement with the highest number of failed tests was women in the film who simply did not have a speaking role. This was surprising and unfortunate to learn because we had thought women would at least have the chance to talk, but maybe that it would mostly be about men.In the table, you can see that the movies that passed the Bechdel test didn't guarantee that they ended up being profitable. One of the movies Dredd 3D, passed the Bechdel test, and the binary test had a domestic gross of 13,414,714.
  Another movie called Captain Phillips failed the Bechdel and binary tests but had a domestic gross of 107,136,417.The binary test had the most number of failed tests because it was a pass or fail, and there was no in-between. The other test had different rankings, and it wasn't just two options like the binary test.If you look at the table, you can see that from 1874 to 1905, it was mainly zeros, and after 1905 it slowly started to get better. In 2021 you will see a lot of threes, so the Bechdel test is changing from 1874 to 2021."),
p("Discussion: It is important to track our progress in regards to representation throughout the years because this is the only way we can see positive societal changes are, in fact, being made. It is reassuring to find that MORE movies to this day are passing the Bechdel Test, but it is equally important to ackowledge how the Bechdel Test measures the bare minimum and still not ALL movies are passing it.
Additionally, it is important to consider the types of movies that are still not passing the test - unfortunately, many are family movies or films that children would primarily watch. This is signficiant because films teach lessons, condition, and socialize humans whether we are concious of it or not. Children specifically, are still developing and making neurological connections about the world they live in,
so by consuming media they are automatically becoming cultured in stereotypes which they will only continue to maintain through future behaviors. We hope that producers, directors, and corporations such as Disney will begin to take this into more consideration when creating films, but in order to do that there has to be a concious effort made to change the establishment in place because currently,
it is naturally sexist or male-oriented. There have been efforts made to diversifying cast members and story-lines which is a positive step in the direction of inclusivity, but we remain lacking in gender inclusion. As we move towards a more progressive future (arguably with Generation Z and social media use paving the way), it will be increasingly important to call on accurate information and data
that effectively assists us in making informed actions in the right direction. This means asking relevent questions such as the Research Questions to help guide us and see where work can be done to further increase representation."),
p("Conclusion: We have addressed and discussed the film industry's lack of female representation for the most basic of human values. While the Bechdel Test has its flaws, it is the most efficient and decently construcitve system we have to check a movie's inclusivity. We invite you to think keep the three rules of the Bechdel Test in mind when watching your next films and strive for awareness of the ways in which women are being portrayed.
We cannot undo the movies that have already been released nor is it realistic (or needed) to stop watching your favorite films if they do not pass the test, but we can learn from the past and educate others simply by having discussions and debunking representation in films. Start up conversations with your friends and family or whomever you watch movies with, and get others to observe their own biases!"),
p("Acknowledgements: We would like to acknowledge the team-work and communication this project took on all of our parts and the learning curve we experienced by working remotely with new applications."),
p("References: Mitchell, Carolee. “Women in Movies - Dataset by Carolee.” Data.world, 30 Nov. 2017, https://data.world/carolee/women-in-movies/workspace/file filename=movies.csv.

Yao, Alison Yuhan. “Bechdel Test: Comparing Female Representation Metrics in Movies.” Towards Data Science, 14 Jan. 2022, https://towardsdatascience.com/bechdel- test-comparing-female-representation-metrics-in-movies-6cbade15010f.

Yao, Alison Yuhan. “Movie Bechdel Test Scores.” Kaggle, 2 Jan. 2022, https://www.kaggle.com/alisonyao/movie-bechdel-test-scores.

Creative Commons. (n.d.). Bechdel Test Movie list. Bechdel Test Movie List. Retrieved February 14, 2022, from https://bechdeltest.com/

Seth, R., Tsjeng, Z., Coel, M., Bell, D. V., & Devaney, S. (2020, July 15). Why are films failing the Bechdel test when TV has progressed? British Vogue. Retrieved February 14, 2022, from https://www.vogue.co.uk/arts-and-lifestyle/article/the-bechdel-test

Viswanathan, G. (2021, July 14). What is the Bechdel test and what is its relevance to today’s film industry?, Nightingale. Nightingale. Retrieved February 14, 2022, from https://nightingaledvs.com/what-is-the-bechdel-test-and-what-is-its-relevance-to-todays-film-industry/"),

)


ui <- navbarPage(
  tags$title("movie project"),
 first_page,
 second_page, 
 third_page,
<<<<<<< HEAD
 fifth_page
=======
 fourth_page
>>>>>>> ae8c082d21d2c06b689d906a37b25bcde23c5a6d
)

