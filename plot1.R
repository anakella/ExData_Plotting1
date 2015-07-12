##Create a directory on desktop and set working directory to it to begin the project
## Set File Path 
filePath <- "./Project1/household_power_consumption.txt"

## PCD variable reads power consumption data from the file located in file path
PCD <- read.csv(filepath,header=T, sep=';', na.strings="?")

## Convert date into date format using as.Date
## Selecting subset of data for data betwwen 01/02/2007 and 02/02/2007
PCD$Date <- as.Date(PCD$Date, format="%d/%m/%Y")
PCDSubset <- subset(PCD, Date >="2007-02-01" & Date <="2007-02-02")

##Plot using png
## Histogram for Global Active Power from the subset of data-- Plot 1
png("plot1.png",width=480, height=480)
hist(PCDSubset$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()
## anakella (C) 2015
