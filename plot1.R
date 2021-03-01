#Loading the data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehol
d_power_consumption.zip"
#download.file(fileurl, destfile = "pj1_data.zip")
#unzip(zipfile = "pj1_data.zip")

RawData <- read.table("household_power_consumption.txt", header = T,
                      stringsAsFactors = F,
                      na.strings = "?", sep = ";", quote = "",
                      skip = 66636, nrows = 2880)
tail(RawData, 10)

colnames(RawData) <- c("Date", "Time", "GlobalActivePower", 
                       "GlobalReactivePower", "Voltage", 
                       "GlobalIntensity", "SubMetering1", 
                       "SubMetering2", "SubMetering3")


RawData$DateTime <- strptime(paste(RawData$Date, RawData$Time),
                             format = "%d/%m/%Y %H:%M:%S")

##Making Plots
#plot1
png('plot1.png', width = 480, height = 480)
hist(RawData$GlobalActivePower, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()