rm(list = ls())
getwd()
setwd(dir = "C:/RK/Coursera/EDA/W1")

list.files()

path <- ("./data/household_power_consumption.txt")

#2007-02-01 and 2007-02-02 dates only
data <- read.table(path, skip = 66637, nrow = 2880, sep = ";" , stringsAsFactors = FALSE, dec = "." )
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage" , "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

#quick look into the data
summary(data)
head(data)
tail(data)


#### plot4 ####

#Date and Time columns merged and formatted into datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
#Sub metering inputted into separate vectors
Sub_metering_1 <- data$Sub_metering_1
Sub_metering_2 <- data$Sub_metering_2
Sub_metering_3 <- data$Sub_metering_3


#open file graphic
png("plot4.png", width=480, height=480)

#set environment
par(mfrow=c(2,2))

#sub-plot1
plot(datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#sub-plot2 
plot(datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

#sub-plot3
plot(datetime, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(datetime, Sub_metering_1, col = "black", type = "l" )
lines(datetime, Sub_metering_2, col = "red", type = "l" )
lines(datetime, Sub_metering_3, col = "blue", type = "l" )
legend("topright",  col = c("black", "red", "blue"), lty = 1, lwd =2.5, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#sub-plot4
plot(datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#close connection
dev.off()