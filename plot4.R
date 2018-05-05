setwd("C:/Users/polly.halton/Documents/Coursera/Exploratory_Data_Analysis/Week1")

object.size(read.table("household_power_consumption.txt", sep = ";", header=TRUE))

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,
                   stringsAsFactors = FALSE, dec="." )




Sub<-  data[data$Date %in% c("1/2/2007","2/2/2007") ,]

Sub$datetime <- strptime(paste(Sub$Date, Sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Sub[,3:9] <- apply(Sub[,3:9],2,as.numeric)

png(file = "plot4.png")

par(mfrow= c(2,2))

###first plot

with(Sub, plot(datetime, Global_active_power, type ="l", ylab = "Global Active Power"))

### second plot

with(Sub, plot(datetime,Voltage, type ="l", xlab = "datetime", ylab="Voltage"))

### third plot

with(Sub, plot(datetime, Sub_metering_1, main = "", xlab = "", 
               ylab = "Energy sub metering", type ="n"))

with(Sub, lines(datetime, Sub_metering_1, type ="l",col = "black"))


with(Sub, lines(datetime, Sub_metering_2, type ="l",col = "red"))


with(Sub, lines(datetime, Sub_metering_3, type ="l",col = "blue"))

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1, lwd=2.5,, col = c("black","blue","red") )


## fourth plot



with(Sub, plot(datetime,Global_reactive_power, type ="l", xlab = "datetime"))



dev.off()