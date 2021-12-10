server = function(input, output, session) {
    
    
    #First Tab
    dataInput_bar1 <- eventReactive(input$action_bar1,{
        source("functions/artist_search_bar1.R")
        artist_search_fun(input$artist_name_bar1, input$radio1)
    })

    output$Table_1 <- renderTable({
        dataInput_bar1()
    }) 

    #Second Tab
    dataInput_bar2a <- eventReactive(input$action_bar2a,{
        source("functions/artist_search_bar2a.R")
        artist_plot_fun(input$artist_name_bar2a, input$radio2a)
    })
    
    output$Plot_2a <- renderPlot({
        dataInput_bar2a()
    })
    
    dataInput_bar2b <- eventReactive(input$action_bar2b,{
        source("functions/artist_search_bar2b.R")
        artist_plot_fun(input$artist_name_bar2b, input$checkbox2b_1, input$checkbox2b_2)
    })
    
    output$Message_2b <- renderText({
        if(length(input$checkbox2b_1) + length(input$checkbox2b_2) != 2) {
            paste("Please choose exactly 2 checkboxes")
        }
    })
        
    output$Plot_2b <- renderPlot({
        dataInput_bar2b()
    })
    
    #Third Tab
    dataInput_bar3 <- eventReactive(input$action_bar3, {
        source("functions/grammy_regression.R")
        grammy_reg_fun(input$radio3, input$checkbox3)
    })
    
    plotInput_bar3 <- eventReactive(input$action_bar3, {
        source("functions/grammy_scatter.R")
        grammy_plot_fun(input$radio3, input$checkbox3)
    })
    
    output$LM3 <- renderPrint({
        dataInput_bar3()
    })
    
}