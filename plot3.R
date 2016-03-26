#Clean up workspace
rm(list=ls())

library(ggplot2)


data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)

with (data, {
  plot(data$DateTime, data$Sub_metering_1,  type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(data$DateTime, data$Sub_metering_2, col = 'Red')
  lines(data$DateTime, data$Sub_metering_3, col = 'Blue')
})
  
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()