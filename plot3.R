#load data, question marks are missing
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#subset to the dates using 2007-02-01 and 2007-02-02
data$cleandate <- as.Date(data$Date, format='%d/%m/%Y')
ds <- data[data$cleandate >= "2007-02-01" & data$cleandate <= "2007-02-02",]

#convert date and time to datetime var w correct format
datetime <- paste(as.character(ds$Date), as.character(ds$Time))
ds$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


#plot 3
png(file = "plot3.png") #open file
#plot line 1, add the next two lines
plot(ds$datetime, ds$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(ds$datetime, ds$Sub_metering_2, type ='l', col = 'red')
lines(ds$datetime, ds$Sub_metering_3, type ='l', col = 'blue')
#add the legend
legend("topright", lty = 1, col = c('black', "blue", 'red'), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() #close file





