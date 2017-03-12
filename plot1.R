#load data, question marks are missing
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings = "?")

#subset to the dates using 2007-02-01 and 2007-02-02
data$cleandate <- as.Date(data$Date, format='%d/%m/%Y')
ds <- data[data$cleandate >= "2007-02-01" & data$cleandate <= "2007-02-02",]

#convert date and time to datetime var w correct format
datetime <- paste(as.character(ds$Date), as.character(ds$Time))
ds$datetime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")


#plot 1
png(file = "plot1.png") #open file
#create a histogram
hist(ds$Global_active_power, col ="red", xlab ="Global Active Power (kilowatts)", main="Global Active Power")
dev.off() #finish plot