dir <- 'C:/OneDrive/RCoursera_specialization/04_ExploratoryDataAnalysis/CP1/exdata-data-household_power_consumption/'
setwd(dir)
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power <- power[grep('^1/2/2007|^2/2/2007',power$Date), ]

power$weekDay <- weekdays(as.Date(power$Date))

plot(power$Global_active_power, type = 'l', axes=FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
box()
axis(2,seq(0,max(power$Global_active_power), by = 2),las=3)
pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))

png(filename = 'plot2.png', width = 480, height = 480)
plot(power$Global_active_power, type = 'l', axes=FALSE, ylab = 'Global Active Power (kilowatts)', xlab = '')
box()
axis(2,seq(0,max(power$Global_active_power), by = 2),las=3)
pos.axis <- c(which(!duplicated(power$weekDay)), nrow(power))
axis(1, at=pos.axis, labels=c('Thu', 'Fri', 'Sat'))
dev.off()