## reading data file
sourcefile <- "./household_power_consumption.txt"
data <- read.table(sourcefile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subsetting data
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting line chart for plot2
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
