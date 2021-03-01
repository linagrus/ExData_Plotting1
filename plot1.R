## reading data file
sourcefile <- "./household_power_consumption.txt"
data <- read.table(sourcefile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
# subsetting data
SubsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## plotting histogram for plot1
GlobalActivePower <- as.numeric(SubsetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()