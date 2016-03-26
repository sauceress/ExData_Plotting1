#Clean up workspace
rm(list=ls())

# load libraries

library(ggplot2)


# parse the data from household_power_consumption.txt and load only 2 days worth of info into data


data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Save the file and plot the graph

png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "Day")

# Turn off the graphics device


dev.off()