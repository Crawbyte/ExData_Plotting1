datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
activeP <- as.numeric(subsetData$Global_active_power)
png("plot2.png", 
    width=480, 
    height=480, 
    units = "px", 
    bg = "transparent")
plot(datetime, 
     activeP, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()