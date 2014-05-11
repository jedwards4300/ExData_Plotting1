#Read data from file
data <- read.table(file="household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=FALSE)

#Extract the proper time interval
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
index <- (data$Date == as.Date("01/02/2007","%d/%m/%Y") | (data$Date == as.Date("02/02/2007","%d/%m/%Y")))
data <- data[index,] 

#Create plot
png(filename = "plot1.png", width = 480, height = 480)
data$Global_active_power <- as.numeric(data$Global_active_power)
with(data,hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.off()
