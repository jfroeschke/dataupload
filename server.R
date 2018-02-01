server <- function(input, output, session) {
  
########################### Import data and save as reactive object ###############
  ###upload data into a reactive
  upload <- reactive({
    req(input$file1)
    
    df <- read.csv(input$file1$datapath)
  })
  
  ########################### End: Import data and save as reactive object ###############
  ###upload data into a reactive  
  
  ############## Display summary data after import: may want to provide a summary in a table below the data
  output$contents <- renderTable({
    upload()
            })
  
  #### could output a summary table here
  ############## End: Display summary data after import: may want to provide a summary in a table below the data
  
  ################  This triggers to act on the uploaded data on button click ################
  
  randomVals <- eventReactive(input$model, {
    upload()
  })
  
  output$plot <- renderPlot({
    plot( randomVals()[,1],  randomVals()[,2])
  })
  
  ################  This triggers to act on the uploaded data on button click ################

}