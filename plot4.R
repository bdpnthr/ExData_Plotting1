library(data.table)

# Read only needed dates directly
data <- fread("household_power_consumption.txt", na.strings = "?")

# Filter for 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert Date and Time into a DateTime object
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 4: Multi-Panel Plot
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

# Top-left: Global Active Power
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Top-right: Voltage
plot(data$DateTime, data$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Bottom-left: Energy Sub-Metering
plot(data$DateTime, data$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=1, bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Bottom-right: Global Reactive Power
plot(data$DateTime, data$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()
