library(data.table)
library(jpeg)
library(lubridate)
consumption <- read.table('household_power_consumption.txt', 
                          header=TRUE, sep=";", na.strings = c('?'),
                          colClasses=c(Date="character",Time="character",Global_active_power="numeric",Global_reactive_power="numeric",Voltage="numeric",Global_intensity="numeric",Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric"))
twoday_consumption <- filter(consumption,Date == "1/2/2007"|Date == "2/2/2007")
plot_consumption <- mutate(twoday_consumption,
                           dt = dmy(Date),
                           dow = wday(Date),
                           dttm = dmy_hms(paste(Date,Time)))

with(plot_consumption,plot(dttm, Sub_metering_1, type="l", xlab="",ylab="Energy sub metering"))
with(plot_consumption,lines(dttm, Sub_metering_2, col="red"))
with(plot_consumption,lines(dttm, Sub_metering_3, col="blue"))


legend('topright', names(plot_consumption)[7:9],
       lty=1, col=c('black', 'red', 'blue'), bty='n', cex=.75)

