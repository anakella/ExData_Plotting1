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

##Plot using png
## Line Plot for Global Active Power from the subset of data --Plot 2
png("plot2.png",width=480, height=480)
plot(PCDSubset$Datetime, PCDSubset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
## anakella (C) 2015
