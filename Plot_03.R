activeP <- as.numeric(subsetData$Global_active_power)
subMetering_1 <- as.numeric(subsetData$Sub_metering_1)
subMetering_2 <- as.numeric(subsetData$Sub_metering_2)
subMetering_3 <- as.numeric(subsetData$Sub_metering_3)

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