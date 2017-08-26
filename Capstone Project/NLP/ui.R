## Capstone: Coursera Data Science
## Final Project

library(shiny)
library(markdown)

## SHINY UI
shinyUI(
  navbarPage("Natural Language Processing",
             tabPanel("NLP",
                      mainPanel(
                        textInput("inputText", "ENTER TEXT HERE",value = ""),
                        tags$head(tags$style(type="text/css", "#inputText {width: 800px}")),
                        actionButton("prediction1", ""),
                        tags$head(tags$style(type="text/css", "#prediction1 {width: 100px}")),
                        actionButton("prediction2", ""),
                        tags$head(tags$style(type="text/css", "#prediction2 {width: 100px}")),
                        actionButton("prediction3", ""),
                        tags$head(tags$style(type="text/css", "#prediction3 {width: 100px}")),
                        br(),
                        br(),
                        strong("WORD / TEXT / SENTENCE ENTERED:"),
                        br(),
                        br(),
                        code(textOutput('sentence1')),
                        tags$head(tags$style(type="text/css", "#sentence1 {color: black; font-style: italic; font:comic-sans}")),
                        br()
                        )         
                      ),
             tabPanel("What's this app ?",
                      mainPanel(
                        p("Hello World"),
                        p("This is an web application which predicts the next word of a sentence using Natural Language Processing."),
                        p("The database for this app are data files which are parsed and stored."),
                        p("This app predicts the next word of the word entered by the user. The app shows top 3 predictions in the buttons below the text box."),
                        p("The user can either enter the word in the input or click the button which user thinks is the right word."),
                        p("If the app could not find a suitable word, the most commonly used words are returned.")
                      )
                      )
             )
  )