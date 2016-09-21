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



#### plot1 ####

#open file graphic
png("plot1.png", width=480, height=480)
#plot
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
#close connection
dev.off()