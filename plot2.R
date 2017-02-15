## Loading data. Source file MUST be in R work directory
alldata <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

## Subsetting dates '2007-02-01' and '2007-02-02'
alldata <- subset(alldata, alldata$Date == '1/2/2007' | alldata$Date == '2/2/2007')

## Converting date and time variables into the variable Date with appropriate class
alldata$Date <- paste(as.character(alldata$Date), as.character(alldata$Time))
alldata$Date <- strptime(alldata$Date, '%d/%m/%Y %H:%M:%S')

## Opening graphical device and plotting
png("plot2.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
plot(alldata$Date, alldata$Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)', xlab = '')
dev.off()