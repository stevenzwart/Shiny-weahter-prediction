shinyUI(pageWithSidebar(
  headerPanel('Weather prediction in the Netherlands'),
  sidebarPanel(
    numericInput('year', 'Year', 2012, min=1900, max=2100, step=1),
    selectInput('month', 'Month', c('01', '02', '03', '04'
		                   ,'05', '06', '07', '08'
		                   ,'09', '10', '11', '12')),
    selectInput('day', 'Day', 1:31),
    br(),
    actionButton("goButton", "Go!")
  ),
  mainPanel(
    plotOutput('plot1'),
    h4("Legend: "),
    h4("Sun     - Sunshine in quarters of hour"),
    h4("P Amt   - Precipitation amount in 0.1 mm"),
    h4("P Dur   - Precipitation duration in quarters"),
    h4("Wind    - Wind in 0.1 m/s"),
    h4("Temp    - Temperature in degrees Celsius")
  )
))
