#load data, question marks are missing
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#subset to the dates using 2007-02-01 and 2007-02-02
data$cleandate <- as.Date(data$Date, format='%d/%m/%Y')
ds <- data[data$cleandate >= "2007-02-01" & data$cleandate <= "2007-02-02",]

#convert date and time to datetime var w correct format
datetime <- paste(as.character(ds$Date), as.character(ds$Time))
ds$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


#plot 4
png(file = "plot4.png") #open file
par(mfrow = c(2, 2)) #set 4 plots in two rows
#plot 1 - line graph of global active pwr
plot(ds$datetime, ds$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
#plot 2 line graph of voltage
plot(ds$datetime, ds$Voltage, type="l", ylab = "Voltage", xlab = "datetime")
#plot 3 - create first line, add 2 and 3 w lines
plot(ds$datetime, ds$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(ds$datetime, ds$Sub_metering_2, type ='l', col = 'red')
lines(ds$datetime, ds$Sub_metering_3, type ='l', col = 'blue')
#add legend - sans line, shrink text size
legend("topright", lty = 1, bty= 'n', col = c('black', "blue", 'red'),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = .7)
#plot 4 - global reactive power
plot(ds$datetime, ds$Global_reactive_power, type ='l', xlab = "datetime", ylab = "Global_reactive_power")
dev.off() #close file
