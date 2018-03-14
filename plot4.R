setwd("~/Dropbox/Coursera")
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?", check.names=F, stringsAsFactors=F)
power$Date <- as.Date(power$Date, format="%d/%m/%Y")
###subsetting the data
power_subset <- subset(power, subset=(Date >= "2007-02-01" & Date <= "2007-02-02")) 
rm(power)

## dates conversion
power_datetime <- paste(as.Date(power_subset$Date), power_subset$Time)
power_subset$Datetime <- as.POSIXct(power_datetime)

#Plot4.R
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_subset, {plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="")
plot(Sub_metering_1~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2~Datetime,col='Red')
lines(Sub_metering_3~Datetime,col='Blue')
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power~Datetime, type="l", 
ylab="Global Rective Power (kilowatts)",xlab="")})

# Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
