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
with(plot_consumption, plot(dttm, Global_active_power, type="l", 
                            xlab="",ylab="Global Active Power (killowatts)"))