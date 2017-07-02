library(shiny)
library(datasets)
library(dplyr)
shinyServer(function(input, output){
  output$table <- renderDataTable({
    data <- transmute(mpg, Manufacturer = mpg$manufacturer, Model = mpg$model, 
                      Year = mpg$year, GasExpenditure = (input$hwy/mpg$hwy+input$city/mpg$cty)*input$cost, 
                      Class = mpg$class);
    data <- filter(data, Class %in% input$class);
    data <- arrange(data, GasExpenditure);
    data
  }, options = list(lengthMenu = c(5, 15, 30), pageLength = 30))
})