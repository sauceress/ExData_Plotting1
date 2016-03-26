#Clean up workspace
rm(list=ls())

library(ggplot2)



data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")


png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "Day")

dev.off()