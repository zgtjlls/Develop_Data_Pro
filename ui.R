#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
# Define UI for application that draws a histogram
pageWithSidebar(

  # Application title
  headerPanel("Final Project"),

  # Sidebar with a slider input for number of bins
  sidebarPanel(
    selectInput('model_i', 'Select a model', c("y~bx", "y~a+bx")),
    actionButton("go_button", "Go")
   ),

   # Show a plot of the generated distribution
   mainPanel(
       tabsetPanel(
           tabPanel("App",
                plotlyOutput("myPlot"),
                h3("Model Output"),
                verbatimTextOutput("summary")),

            tabPanel("Help",
                     h2("User Manual"),
                     h3("Introduction"),
                     p("This Shiny web application can be used to run models with
                       selected data from a plot."),
                     h3("Inputs"),
                     p("Select a model from the drop down menus on the left.
                       Select data from the plot"),
                     h3("Procedure"),
                     p("After selecting the model and data, simply pressing the
                       'Go' button to run the model."),
                     h3("Outputs"),
                     p("Model summary will be output in the bottom right panel."),
                     h3("Application"),
                     p("This app is handy for doing preliminary model selection/comparing
                       and outlier identification analysis as it provides immediate model
                       estimation with the flexibility of subseting any portion of the data."),
                     h3("Further work"),
                     p("Right now, as an example, only the mtcar data is loaded.
                       This can be further improved by giving user the option to load any data it needed."),
                     p("Moreover, only the simple linear model and the no-intercept model are predefined.
                       This can be improved by allowing the user to define it's own models.")
                     )

   )
)
)
