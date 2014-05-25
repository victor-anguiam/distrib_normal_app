library(shiny)

shinyUI(fluidPage(
    titlePanel("Distribución Normal"),
    
    sidebarLayout(
        sidebarPanel(
            helpText("Muestra una distribución normal en la que se pueden 
                     modificar los parámetros"),
            
            helpText("Modificando el parámetro 'alfa', se puede averiguar 
                     el p-valor correspondiente, dados los demás parámetros"),
            
            sliderInput("mu", 
                        label = "Media: ",
                        min = -10, max = 10, value = 0),
            
            sliderInput("sigma", 
                        label = "Desv. Standard: ",
                        min = 1, max = 10, value = 1),
            
            sliderInput("alfa", 
                        label = "alfa: ",
                        min = 0, max = 1, value = .05)
        ),
        mainPanel(
            plotOutput("plot"),
            
            div(textOutput("texto"), align = "center", style="font-size:150%;")
        )
    )
))