setwd("C:/Users/polly.halton/Documents/Coursera/Exploratory_Data_Analysis/Week1")

object.size(read.table("household_power_consumption.txt", sep = ";", header=TRUE))

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,
                   stringsAsFactors = FALSE, dec="." )




Sub<-  data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Sub$datetime <- strptime(paste(Sub$Date, Sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub[,3:9] <- apply(Sub[,3:9],2,as.numeric)

png(file = "plot2.png")

with(Sub, plot(datetime, Global_active_power, type ="l", xlab ="",
               ylab= "Global Active Power (kilowatts)"))



dev.off()