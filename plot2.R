#Read data from file
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Extract the proper time interval
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
index <- (data$Date == as.Date("01/02/2007","%d/%m/%Y") | (data$Date == as.Date("02/02/2007","%d/%m/%Y")))
data <- data[index,] 

#Create a POSIX-formatted date/time field
data$POSIX <- strptime(paste(data$Date, data$Time, sep=" " ),format = "%Y-%m-%d %H:%M:%S")

#Create plot
png(filename = "plot2.png", width = 480, height = 480)

with(data,plot(POSIX,Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="l"))

dev.off()
