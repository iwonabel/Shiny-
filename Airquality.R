# Building interactive histogram from Airquality dataset

library(shiny)
data(airquality)

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # Title
  titlePanel("Ozone level"),
  
  # Sidebar layout with input and output definitions
  sidebarLayout(
    
    # Sidebar panel for inputs
    sidebarPanel(
      
      # Input: Slider for the number of bins
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 0,
                  max = 30,
                  value = 30,
                  step = 5)
      
    ),
    
    # Main panel for displaying outputs
    mainPanel(
      
      # Output: histogram 
      plotOutput(outputId = "distPlot")
      
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  

  output$distPlot <- renderPlot({
    
    x    <- airquality$Ozone
    x    <- na.omit(x)
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#003366", border = "black",
         xlab = "Ozone level",
         main = "Histogram of Ozone level")
    
  })
  
}

# Create Shiny app 
shinyApp(ui = ui, server = server)




