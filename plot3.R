## Loading data. Source file MUST be in R work directory
alldata <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')

## Subsetting dates '2007-02-01' and '2007-02-02'
alldata <- subset(alldata, alldata$Date == '1/2/2007' | alldata$Date == '2/2/2007')

## Converting date and time variables into the variable Date with appropriate class
alldata$Date <- paste(as.character(alldata$Date), as.character(alldata$Time))
alldata$Date <- strptime(alldata$Date, '%d/%m/%Y %H:%M:%S')

## Opening graphical device and plotting
png("plot3.png", width = 480, height = 480)
Sys.setlocale("LC_TIME", "English")
with(alldata, plot(Date, Sub_metering_1, type='n', xlab = '', ylab = 'Energy sub metering'))
with(alldata, points(Date, Sub_metering_1, type ='l'))
with(alldata, points(Date, Sub_metering_2, col='red', type = 'l'))
with(alldata, points(Date, Sub_metering_3, col='blue', type = 'l'))
legend('topright', lty = 1, col = c("black", "red", "blue"), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
dev.off()