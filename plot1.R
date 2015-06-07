library(data.table)
library(jpeg)
consumption <- read.table('household_power_consumption.txt', 
                          header=TRUE, sep=";", na.strings = c('?'),
                          colClasses=c(Date="character",Time="character",Global_active_power="numeric",Global_reactive_power="numeric",Voltage="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric"))
twoday_consumption <- filter(consumption,Date == "1/2/2007"|Date == "2/2/2007")
hist(twoday_consumption$Global_active_power, axes=FALSE, main="Global Active Power",
     xlab="Global Active Power (killowatts)", col="red")

# draw axis along 'y' axTicks(4) gets the values along 'x' from your plot
axis(2, at=axTicks(4), labels=paste(axTicks(2)/100,"",sep=""))

# draw axis along 'x' axTicks(1) gets the values along 'x' from your plot
axis(1)
# dev.copy(png, file = "geyserplot.png") ## Copy my plot to a PNG file
# dev.off() ## Don't forget to close the PNG device!