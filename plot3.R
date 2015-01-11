dir <- 'C:/OneDrive/RCoursera_specialization/04_ExploratoryDataAnalysis/CP1/exdata-data-household_power_consumption/'
setwd(dir)
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power <- power[grep('^1/2/2007|^2/2/2007',power$Date), ]
power$weekDay <- weekdays(as.Date(power$Date))

with(power, {
  plot(Sub_metering_1, axes = FALSE, type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(Sub_metering_2, col = 'red')
  lines(Sub_metering_3, col = 'blue')
  box()
  axis(2, seq(0,max(power$Sub_metering_1), by = 10), las=3)
  pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
  axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
  legend('topright',col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=1, lwd = 1, bty="o")  
})

png(filename = 'plot3.png', width = 480, height = 480)
with(power, {
  plot(Sub_metering_1, axes = FALSE, type = 'l', ylab = 'Energy sub metering', xlab = '')
  lines(Sub_metering_2, col = 'red')
  lines(Sub_metering_3, col = 'blue')
  box()
  axis(2, seq(0,max(power$Sub_metering_1), by = 10),las=3)
  pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
  axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
  legend('topright',col = c('black', 'blue', 'red'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
         lty=1, lwd = 1, bty="o")  
})
dev.off()