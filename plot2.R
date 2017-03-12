#load data, question marks are missing
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#subset to the dates using 2007-02-01 and 2007-02-02
data$cleandate <- as.Date(data$Date, format='%d/%m/%Y')
ds <- data[data$cleandate >= "2007-02-01" & data$cleandate <= "2007-02-02",]

#convert date and time to datetime var w correct format
datetime <- paste(as.character(ds$Date), as.character(ds$Time))
ds$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


#plot 2
png(file = "plot2.png") #open plot
#create a line graph
plot(ds$datetime, ds$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off() #close file