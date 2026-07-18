library(data.table)

# Read only needed dates directly
data <- fread("household_power_consumption.txt", na.strings = "?")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 1: Histogram
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()
