library(shiny)

# Define server logic required to predict MPG using a linear model
shinyServer(function(input, output) {

  # Output inputs based on input from ui.R
  output$inputhp <- renderPrint({input$hp})
  output$inputcyl <- renderPrint({input$cyl})
  output$inputwt <- renderPrint({input$wt})

  # Generate a linear model that is reactive to the inputs in ui.R
  model <- lm(mpg ~ hp + as.factor(cyl) + wt, data = mtcars)
  modelpred <- reactive({
    hpinput <- input$hp
    cylinput <- input$cyl
    wtinput <- input$wt
    predict(model, newdata = data.frame(hp = hpinput, cyl = cylinput, wt = wtinput))
  })

  # Output the prediction as text
  output$prediction <- renderText({modelpred()})
})
