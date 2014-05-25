
shinyServer(function(input, output) {
    output$plot <- renderPlot({
        mu <- input$mu
        sigma <- input$sigma
        nsigmas <- 4
        limSup <- floor(mu+nsigmas*sigma)
        limInf <- floor(mu-nsigmas*sigma)
        x <- ((100*limInf):(100*limSup))/100
        fx <- (1/(sqrt(2*pi)*sigma)*exp(-.5*((x-mu)/sigma)^2))
        p_valor <- qnorm(input$alfa, mu, sigma)
        plot(x, fx, main=paste("N(", mu, ",", sigma, ")", sep=""), type="l", bty="n", 
             xaxt="n", yaxp=c(0, 0.4, 4), xlab="", ylab="", ylim=c(0,.4))
        axis(1, at=seq(limInf, limSup, sigma))
        #axis(2, at=seq(0, .4, .1), outer=FALSE)
        polygon(x, fx, border=NA, col="light pink")
        polygon(c(x[x<=p_valor], p_valor), c(fx[x<=p_valor], fx[x==limInf]), 
                border=NA, col="light blue")
        abline(0, 0)
    })
    
    output$texto <- renderText({
        p_valor <- qnorm(input$alfa, input$mu, input$sigma) 
        paste("P(x < ", round(p_valor, 3), ") = ", input$alfa, sep="")
    })
})