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

#Next part in the rest of the files (Plot_01,Plot_02...)