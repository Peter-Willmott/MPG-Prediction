library(shiny)

# Define UI for application that predicts car a certain car spec based on selected predictors
shinyUI(fluidPage(
  titlePanel("Car MPG Predictor"),

  # Sidebar with a slider input for number of horse power and weight and radio buttons for number of cylinders
  sidebarLayout(
    sidebarPanel(
       sliderInput("hp",
                   "Horse Power:",
                   min = 60,
                   max = 330,
                   value = 100),
       radioButtons("cyl", "Number of Cylinders:",
                    list("4" = 4,
                         "6" = 6,
                         "8" = 8)),
       sliderInput("wt",
                   "Weight (tons):",
                   min = 1.6,
                   max = 5.4,
                   value = 2.5)

    ),

    # Show the horse power, cylinders and weight chosen from the inputs and the final MPG prediction
    mainPanel(
      h3('Results of prediction'),
      h4('Horse Power Chosen:'),
      verbatimTextOutput("inputhp"),
      h4('Number of Cylinders Chosen:'),
      verbatimTextOutput("inputcyl"),
      h4('Weight Chosen:'),
      verbatimTextOutput("inputwt"),
      h4('Which resulted in a predicted MPG of '),
      verbatimTextOutput("prediction")
    )
  )
))
