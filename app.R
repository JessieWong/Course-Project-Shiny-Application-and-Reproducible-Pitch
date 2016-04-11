library(shiny)
library(ggplot2)
library(lubridate)
setwd('C:/Users/jwong/Desktop/9- Developing Data Products/rsconnect/data')
KL<-read.csv("API_KualaLumpur.csv")
KL$Date <- as.Date(KL$Date, format = "%m/%d/%Y")

#normal ui layout
ui <- fluidPage(
headerPanel("Kuala Lumpur Air Pollutant Index 2014-2015"),
sidebarPanel(
  selectInput("year", label="Select Year", selected=2014, choices=c(2014,2015)),
  selectInput("month", label="Select Month", selected=1, choices=c(1,2,3,4,5,6,7,8,9,10,11,12))
),
mainPanel(
  h3('API Air Pollutant Index for Kuala Lumpur '),
  plotOutput("plot1")
  )
)

server<- function(input, output) {

  output$plot1<-renderPlot({
    
    select_data<-KL[month(KL$Date)==input$month & year(KL$Date)==input$year,]
  
    p<-ggplot(data=select_data, aes(x=select_data$Hour, y=select_data$API))+geom_smooth(color="red")+labs(x="Hour", y="API Reading")
    
    print(p)
    })

}


shinyApp(ui = ui, server = server)
