
library(shiny)
library(tidyverse)
library(patchwork)
data("demo shiny app - iris")

ui <- fluidPage(
    
    titlePanel("Iris - demo shiny app"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("select1", 
                        label = h3("Select variable 1"), 
                        choices = c(names(iris)), 
                        selected = "Sepal.Length"),
            
            selectInput("select2", 
                        label = h3("Select variable 2"), 
                        choices = c(names(iris)), 
                        selected = "Petal.Length")
            
            
        ),
        

        mainPanel(
            tabsetPanel(
                tabPanel("Instructions", 
                         verbatimTextOutput("Instructions")),
                tabPanel("univariate plots", plotOutput("univarPlot")), 
                tabPanel("bivariate plot", plotOutput("bivarPlot")), 
                tabPanel("ratio", verbatimTextOutput("ratio")) 
            )
        )
    )
)
# Define plot
server <- function(input, output) {
    
    output$Instructions <- renderText({
        print(
            c(
                "\n",
                "1. Choose the variables you want to represent on the sidebar panel \n", 
                "2. See Univariate plots for their univariate representation \n", 
                "3. Choose Bivaritate plot for their bivariate representation \n", 
                "4. The Ratio tab shows the average ratio between the selected variables, whenever these are numeric in class"
            )
        )
    })
    
    output$ratio <- renderText({
        
        if(class(iris[,input$select1]) == "numeric" &
           class(iris[,input$select2]) == "numeric") {
            
            s1 <- rlang::sym(input$select1)
            s2 <- rlang::sym(input$select2)
            
            iris %>% 
                mutate(ratio = !!s1/!!s2) %>% 
                summarise(mn = mean(ratio)) %>% 
                pull(mn)
        } else {
            "At least one of the variables is not numeric. A ratio cannot be calculated"
        }
        
        
    })
    
    output$univarPlot <- renderPlot({
        s1 <- rlang::sym(input$select1)
        s2 <- rlang::sym(input$select2)
        
        p1 <- qplot(x = !!s1,
                    data = iris) +
            theme_minimal()
        
        p2 <- qplot(x = !!s2,
                    data = iris) +
            theme_minimal()
        
        p1 + p2
    })
    
    output$bivarPlot <- renderPlot({
        
        s1 <- rlang::sym(input$select1)
        s2 <- rlang::sym(input$select2)
        
        qplot(x = !!s1,
              y = !!s2,
              data = iris) +
            theme_minimal()
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
