library(shiny)
library(ggplot2)
library(reshape)

server <- function(input, output) {
        
        output$distPlot <- renderPlot({
                
                # future value function
                future_value = function(amount, rate, years){
                        FV = amount*(1+rate)^years
                        return(FV)
                }
                
                # annuity function
                annuity = function(contrib, rate, years){
                        FVA = contrib*(((1+rate)^years-1)/rate)
                        return(FVA)
                }
                
                #growing annuity function
                growing_annuity = function(contrib, rate, growth, years){
                        FGVA = contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth))
                        return(FGVA)
                }
                
                
                for (n in 1:(input$years + 1)){
                        if(n == 1){
                                regular = data.frame(
                                        year = seq(0, input$years, 1),
                                        no_contrib = rep(0, input$years + 1),
                                        fixed_contrib = rep(0, input$years + 1),
                                        growing_contrib = rep(0, input$years + 1),
                                        product = rep("regular savings",input$years + 1)
                                )
                        }
                        regular[n,2] = future_value(input$initial, input$rate/100, n-1)
                        regular[n,3] = future_value(input$initial, input$rate/100, n-1) + 
                                annuity(input$annual, input$rate/100, n-1)
                        regular[n,4] = future_value(input$initial, input$rate/100, n-1) + growing_annuity(input$annual, input$rate/100, input$growth/100, n-1)
                        if(n == (input$years + 1)){
                        }
                }
                
                
                # present table
                regular2 = melt(regular, c("year","product"))
                colnames(regular2)[c(3,4)] = c("variable","value") 
                
                # make faceted graph
                
                
                plot1 =  ggplot(data=regular2, aes(x=year, y=value,color=variable)) +
                        geom_line() +
                        xlab("year") + ylab("value") +
                        ggtitle("Three modes of investing") +
                        scale_x_continuous(breaks=seq(0,input$years,5))
                
                
                plot2 =  ggplot(data=regular2, aes(x=year, y=value, color=variable)) +
                        geom_line() +
                        xlab("year") + ylab("value") +
                        ggtitle("Three modes of investing") +
                        scale_x_continuous(breaks=seq(0,input$years,5)) +
                        facet_wrap(~variable) +
                        theme_bw() +
                        geom_area(aes(fill = variable, group = variable),
                                  alpha = 0.5, position = 'identity')
                
                
                ifelse(input$facet == "No",return(plot1),return(plot2))
                
                
                
        })
        
        output$table = renderPrint({
                # future value function
                future_value = function(amount, rate, years){
                        FV = amount*(1+rate)^years
                        return(FV)
                }
                
                # annuity function
                annuity = function(contrib, rate, years){
                        FVA = contrib*(((1+rate)^years-1)/rate)
                        return(FVA)
                }
                
                #growing annuity function
                growing_annuity = function(contrib, rate, growth, years){
                        FGVA = contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth))
                        return(FGVA)
                }
                
                
                for (n in 1:(input$years + 1)){
                        if(n == 1){
                                regular = data.frame(
                                        year = seq(0, input$years, 1),
                                        no_contrib = rep(0, input$years + 1),
                                        fixed_contrib = rep(0, input$years + 1),
                                        growing_contrib = rep(0, input$years + 1),
                                        product = rep("regular savings",input$years + 1)
                                )
                        }
                        regular[n,2] = future_value(input$initial, input$rate/100, n-1)
                        regular[n,3] = future_value(input$initial, input$rate/100, n-1) + 
                                annuity(input$annual, input$rate/100, n-1)
                        regular[n,4] = future_value(input$initial, input$rate/100, n-1) + growing_annuity(input$annual, input$rate/100, input$growth/100, n-1)
                        if(n == (input$years + 1)){
                        }
                }
                
                regular2 = regular[,-5]
                return(head(regular2,11))
        })
}

