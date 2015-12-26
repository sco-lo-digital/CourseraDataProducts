library(shiny)
library(caret)
library(datasets)
library(AppliedPredictiveModeling)
transparentTheme(trans = .4)


server <- function(input, output) {
    output$featPlot <- renderPlot({
        featurePlot(x = iris[, 1:4],
                    y = iris$Species,
                    plot = input$select,
                    scales = list(x = list(relation="free"),
                    y = list(relation="free")),
                    auto.key = list(columns = 3))
        
    })
}

ui <- fluidPage(
    headerPanel("Feature Plot App"),
    sidebarLayout(
        sidebarPanel(
            selectInput("select", label = h3("Select Plot Type"), 
                        choices = list("Strip Plot" = "strip",
                                       "Box Plot"  = "box",
                                       "Pairs Plot" = "pairs",
                                       "Density Plot" = "density"), selected = "pairs")
        ),
        mainPanel("Iris Data Set Exploration: Select the plot type in the drop down to explore the data in different ways", plotOutput("featPlot"))
    )
)

shinyApp(ui = ui, server = server)
