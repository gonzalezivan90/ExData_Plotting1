dir <- 'C:/OneDrive/RCoursera_specialization/04_ExploratoryDataAnalysis/CP1/exdata-data-household_power_consumption/'
setwd(dir)
power <- read.csv("household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)
power <- power[grep('^1/2/2007|^2/2/2007',power$Date), ]


hist(power$Global_active_power, col = 'red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')

png(filename = 'plot1.png', width = 480, height = 480)
hist(power$Global_active_power, col = 'red', 
     main = 'Global Active Power', 
     xlab = 'Global Active Power (kilowatts)')
dev.off()