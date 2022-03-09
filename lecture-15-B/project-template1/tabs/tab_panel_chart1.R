# tab_panel_chart1

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    p("This is chart 1."),
    sidebarLayout(
      sidebarPanel(
        selectInput(
          inputId = "test_result",
          label = "choose a result to display",
          choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                         "dubious"= "dubious","nowomen" = "nowomen",
                         multiple = TRUE,
                         selected = "ok"
          ),
          fluidRow( sidebarPanel(
            selectInput(
              inputId = "year_choose",
              label = "Pick the year",
              choices = list("2013"="2013","2012"="2012","2011"="2011","2010"="2010","2009"="200"),
              multiple = FALSE,
              selected = "2013"
            )
          )
          )
        ),
        mainPanel(
          h2("Ranking resluts per year"),
          p("This interactive chart for gender inequality on the moive screen will display the n ammount 
        of each result every year."),
          plotlyOutput(outputId = "Chart1")
        )
      )
    )
)



sidebarPanel(
  selectInput(
    inputId = "test_result",
    label = "choose a result to display",
    choices = list("ok" = "ok","men" = "men","notalk" = "notalk",
                   "dubious"= "dubious","nowomen" = "nowomen",
                   multiple = TRUE,
                   selected = "ok")
  ),
  selectInput(
    inputId = "year_choose",
    label = "Pick the year",
    choices = list("2013"="2013","2012"="2012","2011"="2011","2010"="2010","2009"="200"),
    multiple = FALSE,
    selected = "2013"
  )
),
mainPanel(
  h2("Ranking resluts per year"),
  p("This interactive chart for gender inequality on the moive screen will display the n ammount 
        of each result every year."),
  plotlyOutput(outputId = "Chart1")
)
)

