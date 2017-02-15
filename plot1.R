## Loading data. Source file MUST be in R work directory
alldata <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

## Subsetting dates '2007-02-01' and '2007-02-02'
alldata <- subset(alldata, alldata$Date == '1/2/2007' | alldata$Date == '2/2/2007')

## Converting date and time variables into appropriate classes
alldata$Date <- as.Date(as.character(alldata$Date), '%d/%m/%Y')
alldata$Time <- strptime(as.character(alldata$Time), '%H:%M:%S')

## Opening graphical device and plotting
png("plot1.png", width = 480, height = 480)
hist(alldata$Global_active_power, col = 'red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()
