activeP <- as.numeric(subsetData$Global_active_power)
png("plot1.png", 
    width=480, 
    height=480, 
    units = "px", 
    bg = "transparent")
hist(activeP, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()