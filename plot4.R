#Clean up workspace
rm(list=ls())


data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width=480, height=480)
par(data, mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data, {
  plot(data$DateTime, data$Global_active_power, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(data$DateTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "DateTime")
  plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(data$DateTime, data$Sub_metering_2, col = 'Red')
  lines(data$DateTime, data$Sub_metering_3, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(data$DateTime, data$Global_reactive_power, type = "l", 
       ylab = "Global_rective_power", xlab = "DateTime")
})

dev.off()