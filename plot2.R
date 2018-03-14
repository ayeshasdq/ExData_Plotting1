setwd("~/Dropbox/Coursera")
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", check.names=F, stringsAsFactors=F)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
###subsetting the data
power_subset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(power)

## dates conversion
power_datetime <- paste(as.Date(power_subset$Date), power_subset$Time)
power_subset$Datetime <- as.POSIXct(power_datetime)

#Plot2.R
plot(power_subset$Global_active_power~power_subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

#Saving as PNG
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
