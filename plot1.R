#Clean up workspace
rm(list=ls())


# parse the data from household_power_consumption.txt and load only 2 days worth of info into data

data <- read.csv("household_power_consumption.txt", na.string="?", sep=";")

data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007"),]

data$DateTime <- strptime(paste(data$Date, data$Time, sep=" "), 
                          format="%d/%m/%Y %H:%M:%S")

# Save the file and plot the graph

png("plot1.png", width=480, height=480)

hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", col="red")

# Turn off the graphics device

dev.off()