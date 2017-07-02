library(shiny)

shinyUI(
  navbarPage("Car for your need",
             tabPanel("Table",
                      sidebarLayout(
                        sidebarPanel(
                          helpText("Help us by providing your driving details"),
                          numericInput('hwy', 'Distance per month you expect to drive in highways', 50, min = 1, max = 1000),
                          numericInput('city', 'Distance per month you expect to drive in city', 50, min = 1, max = 1000),
                          checkboxGroupInput('class', 'Type of car', c("compact"="compact","midsize"="midsize","suv"="suv","2seater"="2seater",
                                                                       "minivan"="minivan","pickup"="pickup"), 
                                             selected = c("compact")),
                          numericInput('cost', 'Gas Price (per gallon):', 2.00, min = 1.50, max = 4, step=0.01)
                        ),
                        mainPanel(
                          dataTableOutput('table')
                        )
                      )
                      ),
             tabPanel("What is this app ?",
                      mainPanel(
                        p("This web based application is developed as part of Developing Data Products course of Data Science Specialization offered by Johns Hopkins University through Coursera website."),

                        p("This app is developed by Shiny package provided by R. It uses the mpg dataset provided by the ggplot2 datasets."),
                             
                        p("This app requires the user to input their monthly driving details. For example, the distance they cover per month in city or in highways. It also prompts user to input fuel price in their area. The app then estimates the fuel price per month for the vehicles available in the database and displays them is descending order of expected Gas price per month."),
                             
                        p("Please note that this app is developed for a course project and uses a dataset with as little as 234 different types of cars, so the results usually will be in the order of 10's of cars.")
                      )
                      )
             )
)