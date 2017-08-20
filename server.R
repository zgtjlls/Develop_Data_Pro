#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    data("mtcars")
    mtcars$cyl <- factor(mtcars$cyl)
    s <-reactive({
        event_data("plotly_selected")
    })
    myModel <- eventReactive(input$go_button,{
        model()
    })
    model <- reactive({
        s <- s()
        if(length(s$x) < 2){
            return(NULL)
        }
        else{
            if(input$model_i == "y~bx"){
                #lm(as.formula(paste(s$y, '~', s$x, "-1")), data = s)
                lm(y ~ x - 1, data = s)
            }
            else{
                lm(y ~ x, data = s)
            }
        }
    })

    output$summary <- renderPrint({
        if(!is.null(myModel())){
            summary(myModel())
        }
        else{
            "No model found"
        }
    })

    output$myPlot <- renderPlotly({

        p <- plot_ly(data = mtcars, x = ~hp, y = ~disp, color = ~cyl,
                     type = "scatter", mode = "marker", key = ~cyl) %>%
                    layout(dragmode = "select")

        p
  })

})
