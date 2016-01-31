shinyServer(function(input, output,session) {

  # Combine the selected variables into a new data frame
  selectedData <- reactive({
    df1[1,1] <- input$year
    df1[1,2] <- input$month
    df1[1,3] <- as.numeric(input$day)
    df1
  })

  prec_results <- reactive({
    c(predict(glmtemp,selectedData())/10, predict(glmwind, selectedData()), predict(glmprectime,selectedData())*4/10
      , predict(glmprecamt, selectedData()), predict(glmsunshine,selectedData())*4/10)
  })

  output$plot1 <- renderPlot({
    barplot(prec_results(), main = "Weather prediction for specified date", horiz = TRUE, names.arg= c("Temp", "Wind"
              , "P dur", "P amt"
              , "Sun"), col=c("Red", "Green", "Lightblue", "Blue", "Yellow"))
  })

})
