library(data.table)

# Read file and reduce to relevant records
hh <- as.data.frame(fread("./data/household_power_consumption.txt",
                          na.strings = "?"))
hh <- subset(hh, Date == "1/2/2007" | Date == "2/2/2007")

# Transform date and time variables
hh$DateTime <- strptime(paste(hh$Date,hh$Time), format = "%d/%m/%Y %T")

# Store default plot parameters
opar <- par()

# Create Plot 4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(hh, {
        plot(DateTime, Global_active_power, type = "l", xlab = "",
             ylab = "Global Active Power")
        plot(DateTime, Voltage, type = "l", xlab = "datetime",
             ylab = "Voltage")
        plot(DateTime,Sub_metering_1,type = "n", main = "", xlab = "",
             ylab = "Energy sub metering")
        lines(DateTime,Sub_metering_1, col = "black")
        lines(DateTime,Sub_metering_2, col = "red")
        lines(DateTime,Sub_metering_3, col = "blue")
        legend("topright", bty = "n", lty = 1, col = c("black","red","blue"), 
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime",
             ylab = "Global_reactive_power")
        
})
dev.off()