library(data.table)

# Read file and reduce to relevant records
hh <- as.data.frame(fread("./data/household_power_consumption.txt",
                          na.strings = "?"))
hh <- subset(hh, Date == "1/2/2007" | Date == "2/2/2007")

# Transform date and time variables
hh$DateTime <- strptime(paste(hh$Date,hh$Time), format = "%d/%m/%Y %T")

# Create Plot 2
png(file = "plot2.png", width = 480, height = 480)
plot(hh$DateTime,hh$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()