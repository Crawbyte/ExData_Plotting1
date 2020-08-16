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
subMetering_1 <- as.numeric(subsetData$Sub_metering_1)
subMetering_2 <- as.numeric(subsetData$Sub_metering_2)
subMetering_3 <- as.numeric(subsetData$Sub_metering_3)

#Plot
png("plot3.png", 
    width=480, 
    height=480, 
    units = "px", 
    bg = "transparent")
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
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue"))
dev.off()