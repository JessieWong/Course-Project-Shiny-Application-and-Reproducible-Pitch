#ui.R
library(shiny)
library(ggplot2)
library(lubridate)

#set working directory
#setwd('C:/Users/jwong/Desktop/9- Developing Data Products/rsconnect/data')
#read the file
#KL<-read.csv("API_KualaLumpur.csv")
#convert the date column to Date format
#KL$Date <- as.Date(KL$Date, format = "%m/%d/%Y")

#normal ui layout
fluidPage(
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