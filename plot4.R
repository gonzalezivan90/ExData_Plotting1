dir <- 'C:/OneDrive/RCoursera_specialization/04_ExploratoryDataAnalysis/CP1/exdata-data-household_power_consumption/'
setwd(dir)
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power <- power[grep('^1/2/2007|^2/2/2007',power$Date), ]

par(mfrow = c(2,2))

power$weekDay <- weekdays(as.Date(power$Date))

plot(power$Global_active_power, type = 'l', axes=FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
box()
axis(2,seq(0,max(power$Global_active_power), by = 2),las=1)
pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

plot(power$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'l', axes=FALSE)
box()
axis(2,seq(ceiling(min(power$Voltage)), max(power$Voltage), by = 4),las=3)
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

with(power, {
  plot(Sub_metering_1, axes = FALSE, type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(Sub_metering_2, col = 'red')
  lines(Sub_metering_3, col = 'blue')
  box()
  axis(2, seq(0,max(power$Sub_metering_1), by = 10),las=3)
  axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
  legend('topright',col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=1, bty="n")  
})

plot(power$Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime', type = 'l', axes = FALSE)
box()
axis(2, seq(0, max(power$Global_reactive_power), by = 0.1), las=3)
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

png(filename = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
plot(power$Global_active_power, type = 'l', axes=FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
box()
axis(2,seq(0,max(power$Global_active_power), by = 2),las=1)
pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

plot(power$Voltage, ylab = 'Voltage', xlab = 'datetime', type = 'l', axes=FALSE)
box()
axis(2,seq(ceiling(min(power$Voltage)), max(power$Voltage), by = 4),las=3)
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

with(power, {
  plot(Sub_metering_1, axes = FALSE, type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(Sub_metering_2, col = 'red')
  lines(Sub_metering_3, col = 'blue')
  box()
  axis(2, seq(0,max(power$Sub_metering_1), by = 10),las=3)
  axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
  legend('topright',col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=1, bty="n")  
})

plot(power$Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime', type = 'l', axes = FALSE)
box()
axis(2, seq(0, max(power$Global_reactive_power), by = 0.1), las=3)
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
dev.off()
