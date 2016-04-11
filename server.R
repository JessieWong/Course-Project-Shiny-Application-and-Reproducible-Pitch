#server.R
library(shiny)
library(ggplot2)
library(lubridate)

#set working directory
#setwd('C:/Users/jwong/Desktop/9- Developing Data Products/rsconnect/data')
#KL<-read.csv("API_KualaLumpur.csv")
#KL$Date <- as.Date(KL$Date, format = "%m/%d/%Y")

server<- function(input, output) {
        
        output$plot1<-renderPlot({
                
                select_data<-KL[month(KL$Date)==input$month & year(KL$Date)==input$year,]
                
                p<-ggplot(data=select_data, aes(x=select_data$Hour, y=select_data$API))+geom_smooth(color="red")+labs(x="Hour", y="API Reading")
                
                print(p)
        })
        
}