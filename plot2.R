library(data.table)

# Read only needed dates directly
data <- fread("household_power_consumption.txt", na.strings = "?")

# Filter for 2007-02-01 and 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Convert Date and Time into a DateTime object
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Plot 2: Line Plot of Global Active Power over Time
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
