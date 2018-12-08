library(data.table)

# Read file and reduce to relevant records
hh <- as.data.frame(fread("./data/household_power_consumption.txt",
                          na.strings = "?"))
hh <- subset(hh, Date == "1/2/2007" | Date == "2/2/2007")

# Create Plot 1
png(file = "plot1.png", width = 480, height = 480)
hist(hh$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()