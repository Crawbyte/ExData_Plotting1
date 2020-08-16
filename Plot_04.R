#Library
library(data.table)

#Download and unzip
dataURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(dataURL, temp)
unzip(temp, 
      files = NULL, 
      list = FALSE, 
      overwrite = TRUE, 
      junkpaths = FALSE, 
      unzip = "internal", 
      setTimes = FALSE,)

#Read the data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, 
                   header = TRUE, 
                   sep = ";", 
                   stringsAsFactors=FALSE, 
                   dec=".")

#Subset
subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
activeP <- as.numeric(subsetData$Global_active_power)
reactiveP <- as.numeric(subsetData$Global_reactive_power)
Voltage <- as.numeric(subsetData$Voltage)
subMetering_1 <- as.numeric(subsetData$Sub_metering_1)
subMetering_2 <- as.numeric(subsetData$Sub_metering_2)
subMetering_3 <- as.numeric(subsetData$Sub_metering_3)

#Plot
png("plot4.png", 
    width=480, 
    height=480)
par(mfrow = c(2, 2)) 

plot(datetime, 
     activeP, 
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(datetime, 
     Voltage, 
     type="l", 
     xlab="datetime", 
     ylab="Voltage")

plot(datetime, 
     subMetering_1, 
     type="l", 
     ylab="Energy Submetering",
     xlab="")
lines(datetime, 
      subMetering_2, 
      type="l", 
      col="red")
lines(datetime, 
      subMetering_3, 
      type="l", 
      col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, 
       lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")

plot(datetime, 
     reactiveP, 
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")

dev.off()