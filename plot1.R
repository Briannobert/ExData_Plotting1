#Loading the data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehol
d_power_consumption.zip"
#download.file(fileurl, destfile = "pj1_data.zip")
#unzip(zipfile = "pj1_data.zip")

rawData <- read.table("household_power_consumption.txt", header = T,
                      stringsAsFactors = F,
                      na.strings = "?", sep = ";", quote = "",
                      skip = 66636, nrows = 2880)
tail(rawData, 10)

colnames(rawData) <- c("Date", "Time", "GlobalActivePower", 
                       "GlobalReactivePower", "Voltage", 
                       "GlobalIntensity", "SubMetering1", 
                       "SubMetering2", "SubMetering3")


rawData$DateTime <- strptime(paste(rawData$Date, rawData$Time),
                             format = "%d/%m/%Y %H:%M:%S")

##Making Plots
#plot1
png('plot1.png', width = 480, height = 480)
hist(rawData$GlobalActivePower, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()