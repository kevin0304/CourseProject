# server.R

library(shiny) # load the shiny package


shinyServer(
        function(input, output) {
                
                output$hist <- renderPlot({
                        lambda <-  input$Seizures
                        if(lambda >= 1 & lambda <= 50) {
                                lambda <- lambda + 1
                        } else{
                                lambda <- lambda *0.8
                        }
                        if(input$Medication == TRUE){
                                lambda <- lambda*0.3
                        }
                        if(input$Sleep == TRUE){
                                lambda <- lambda*0.5
                        }
                        if(input$Alcohol == TRUE){
                                if(lambda == 0){
                                        lambda <- 1
                                }
                                lambda <- lambda*1.1
                        } else{
                                lambda <- lambda*0.5
                        }
                        lambda <- floor(lambda)
                        distribution <- rpois(10000, lambda)
                        lower <- quantile(distribution, probs = 0.025)
                        upper <- quantile(distribution, probs = 0.975)
                        hist(distribution, freq = FALSE,
                             xlab = paste("You will likely have between", lower, "and", upper, "seizure/s in the next month."),
                             main = "Histogram of Seizure distribution in the next month")
                        abline(v=lambda, col="blue", lwd=3)
                        abline(v=lower , col="red", lwd=2)
                        abline(v=upper , col="red", lwd=2)
                        
                })
        }
)
