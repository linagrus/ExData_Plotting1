## reading data file
sourcefile <- "./household_power_consumption.txt"
data <- read.table(sourcefile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subsetting data
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# getting variables for plot4
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubsetData$Global_reactive_power)
voltage <- as.numeric(SubsetData$Voltage)
SubMetering1 <- as.numeric(SubsetData$Sub_metering_1)
SubMetering2 <- as.numeric(SubsetData$Sub_metering_2)
SubMetering3 <- as.numeric(SubsetData$Sub_metering_3)

## plotting 4 charts in a window for plot4
# global settings for charts
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

#top left chart
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
#top right chart
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#bottom left chart
plot(datetime, SubMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, SubMetering2, type="l", col="red")
lines(datetime, SubMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")
#bottom right chart
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
