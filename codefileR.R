##Loading the data
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhou
sehold_power_consumption.zip"
#download.file(fileurl, destfile = "cv2_data.zip")
#unzip(zipfile = "cv2_data.zip")

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
hist(RawData$GlobalActivePower, col = "red", 
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

#plot2


plot(x = RawData$DateTime, y = RawData$GlobalActivePower,type = "l",
     xlab = NA, ylab = "Global Active Power (kilowatts)")

#plot3
plot(x = RawData$DateTime, y = RawData$SubMetering1, type = "l",
     xlab = NA, ylab = "Energy sub metering")
lines(x = RawData$DateTime, y = RawData$SubMetering2, col = "red")
lines(x = RawData$DateTime, y = RawData$SubMetering3, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"),
       col = c("black", "red", "blue"),
       lwd = 1)

#plot4
par(mfrow = c(2,2))

#plot 4a
plot(x = RawData$DateTime, y = RawData$GlobalActivePower,type = "l",
     xlab = NA, ylab = "Global Active Power")

#plot 4b
plot(x = RawData$DateTime, y = RawData$Voltage,type = "l",
     xlab = "datetime", ylab = "Voltage")

#plot 4c
plot(x = RawData$DateTime, y = RawData$SubMetering1,type = "l",
     xlab = NA, ylab = "Energy sub metering")
lines("topright", 
      legend = c("Sub_metering_1", "Sub_metering_2", 
                  "Sub_metering_3"),
      col = c("black", "red", "blue"),
      lwd = 1, bty = "n")

#plot 4d
plot(x = RawData$DateTime, y = RawData$GlobalReactivePower,
     type = "1", xlab = "datetime", ylab = "Global_Reactive_Power")