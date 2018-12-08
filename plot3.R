library(data.table)

# Read file and reduce to relevant records
hh <- as.data.frame(fread("./data/household_power_consumption.txt",
                          na.strings = "?"))
hh <- subset(hh, Date == "1/2/2007" | Date == "2/2/2007")

# Transform date and time variables
hh$DateTime <- strptime(paste(hh$Date,hh$Time), format = "%d/%m/%Y %T")

# Create Plot 3
png(file = "plot3.png", width = 480, height = 480)
with(hh, plot(DateTime,Sub_metering_1,type = "n", main = "", xlab = "",
              ylab = "Energy sub metering"))
with(hh, lines(DateTime,Sub_metering_1, col = "black"))
with(hh, lines(DateTime,Sub_metering_2, col = "red"))
with(hh, lines(DateTime,Sub_metering_3, col = "blue"))
legend("topright", lty = 1, col = c("black","red","blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()