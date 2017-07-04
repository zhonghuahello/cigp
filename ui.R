library(shiny)

csv.path <- paste(path, "/etfdata.csv", sep = '')
etf.data <- read.csv(csv.path)

# Define UI for etf filter
shinyUI(fluidPage(
  
  # Application title
  headerPanel("ETF"),
  
 fluidRow( 
   sidebarPanel(
     sliderInput("vol","Volatility Range",
                min=0, 
                max=400,
                value=c(10,11.3)
       
     ),
     width=12
    
     )
  ),
  
  fluidRow(
    column(width = 3,
           selectInput("Security.Type","Security Type",
                       c("All",levels(etf.data$Security.Type)))
    ),
    column(width = 3,
            selectInput("Asset.Class","Asset Class Focus",
                          c("All",levels(etf.data$Asset.Class)))
      ),
    column(width = 3, 
            selectInput("Industry","Industry Focus",
                         c("All",levels(etf.data$Industry)))
      ),
    column(width = 3, 
           selectInput("Geo.Focus","Geography Focus",
                       c("All",levels(etf.data$Geo.Focus)))
    )
    
  ),

  mainPanel(
    DT::dataTableOutput("table")
  )
))   