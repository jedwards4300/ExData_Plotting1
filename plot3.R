#Read data from file
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Extract the proper time interval
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
index <- (data$Date == as.Date("01/02/2007","%d/%m/%Y") | (data$Date == as.Date("02/02/2007","%d/%m/%Y")))
data <- data[index,] 

#Create a POSIX-formatted date/time field
data$POSIX <- strptime(paste(data$Date, data$Time, sep=" " ),format = "%Y-%m-%d %H:%M:%S")

#Create plot
png(filename = "plot3.png", width = 480, height = 480)

with(data,{plot(POSIX,Sub_metering_1,type="l",col="black",ylab = "Energy sub metering", xlab="")
           lines(POSIX,Sub_metering_2,type="l",col="red")
           lines(POSIX,Sub_metering_3,type="l",col="blue")})
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1)

dev.off()
