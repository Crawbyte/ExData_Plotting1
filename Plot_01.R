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

#Plot
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