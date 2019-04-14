library(shiny)


ui <- fluidPage(
        
        # Application title
        titlePanel("Simulation of Saving/Investing Scenarios"),
        
        # Sidebars and select
        fluidRow(
                column(3,
                       sliderInput("initial",
                                   "Initial Amount",
                                   min = 0,
                                   max = 100000,
                                   value = 1000,
                                   pre = "$", 
                                   sep = ",",
                                   step= 500),
                       sliderInput("annual",
                                   "Annual Contribution",
                                   min = 0,
                                   max = 50000,
                                   value = 2000,
                                   pre = "$", 
                                   sep = ",",
                                   step= 500)),
                column(4,offset=1,
                       sliderInput("rate",
                                   "Return Rate (in %)",
                                   min = 0,
                                   max = 20,
                                   value = 5,
                                   step= 0.1),
                       sliderInput("growth",
                                   "Growth Rate (in %)",
                                   min = 0,
                                   max = 20,
                                   value = 2,
                                   step= 0.1)),
                column(4,
                       sliderInput("years",
                                   "Years",
                                   min = 0,
                                   max = 50,
                                   value = 20,
                                   step= 1),
                       selectInput("facet",
                                   label = "Facet?",
                                   choices = c("No","Yes"),
                                   selected = "No"
                       )
                ),
                
                # Show a plot and a table
                mainPanel(
                        h4(strong("Timelines")),     
                        plotOutput("distPlot", width = "150%"),
                        h4(strong("Balances")),
                        verbatimTextOutput("table")
                )
        )
)
