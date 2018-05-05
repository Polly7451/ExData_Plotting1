setwd("C:/Users/polly.halton/Documents/Coursera/Exploratory_Data_Analysis/Week1")

object.size(read.table("household_power_consumption.txt", sep = ";", header=TRUE))

data <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,
                   stringsAsFactors = FALSE, )

data$Date <- dmy(data$Date)
data$Time <- strptime(data$Time, format = "%H:%M:%S")

Sub<- subset(data, Date >= '2007-02-01' & Date <= '2007-02-02')

Sub[,3:9] <- apply(Sub[,3:9],2,as.numeric)


png(file = "plot1.png")

hist(Sub$Global_active_power, xlab ="Global Active Power (kilowatts)",
     ylab = "Frequency", col = "red", main = "Global Active Power")



dev.off()