##Create a directory on desktop and set working directory to it to begin the project
## Set File Path 
filePath <- "./Project1/household_power_consumption.txt"

## PCD variable reads power consumption data from the file located in file path
PCD <- read.csv(filepath,header=T, sep=';', na.strings="?")

##1. Selecting subset of data for data betwwen 01/02/2007 and 02/02/2007
##2. Create new Column that formats both Date and time combined into one using strptime
##3. Convert date into date format using as.Date -- not a necessary step but useful 
PCDSubset <- PCD[PCD$Date %in% c("1/2/2007","2/2/2007") ,]
PCDSubset$DateTime <- strptime(paste(PCDSubset$Date, PCDSubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
PCD$Date <- as.Date(PCD$Date, format="%d/%m/%Y")

## Plot using png
## Combining Multiple Power Consumption Data Plots into one. 
## Plots Available
#  1. Global Active Power
#  2. Voltage
#  3. Sub metering 
#  4. Global Reactive Power
png("plot4.png", width=480, height=480)
layout(matrix(c(1,2,3,4), 2, 2, byrow = TRUE)) # Lays out the grid for combination plots
plot(PCDSubset$DateTime, PCDSubset$Global_active_power, type="l",xlab="", ylab="Global Active Power")
plot(PCDSubset$DateTime, PCDSubset$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(PCDSubset$DateTime, PCDSubset$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
  lines(PCDSubset$DateTime, PCDSubset$Sub_metering_2, type="l", col="red")
  lines(PCDSubset$DateTime, PCDSubset$Sub_metering_3, type="l", col="blue")
  legend("topright",lty=1, lwd=2,bty="n",col=c("black","red","blue"),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(PCDSubset$DateTime, PCDSubset$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
## anakella (C) 2015