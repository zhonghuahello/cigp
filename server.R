library(shiny)
library(DT)

csv.path <- paste(path, "/etfdata.csv",sep = '')
etf.data <- read.csv(csv.path)#, stringsAsFactors = FALSE

etf.data$Volatility <- as.numeric(as.character(etf.data$Volatility))

# delete the NA volatility
etf.data <- na.omit(etf.data)

# Define server logic required to plot various variables
shinyServer(function(input, output) {

  # Generate a list of the requested variable  
  output$table <- DT::renderDataTable(
    {
    #DT::datatable(
    #{
     if(input$Security.Type!="All"){
        etf.data <- etf.data[etf.data$Security.Type ==input$Security.Type,]
      }
      
     if(input$Asset.Class!="All"){
       etf.data <- etf.data[etf.data$Asset.Class ==input$Asset.Class,]
     }
    
      if(input$Industry!="All"){
        etf.data <- etf.data[etf.data$Industry ==input$Industry,]
      }
      
      if(input$Geo.Focus!="All"){
        etf.data <- etf.data[etf.data$Geo.Focus ==input$Geo.Focus,]
      }
      
      etf.data <- etf.data[etf.data$Volatility>=input$vol[1]&etf.data$Volatility<=input$vol[2],]
      
    etf.data
 
   #} 
   #)
    
  }
  )
  
})