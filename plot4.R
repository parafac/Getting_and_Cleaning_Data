# from the UC Irvine Machine Learning Repository,
# It is assumed the data is downloaded, unzipped, and available in the
# current working directory.

# import data with read.csv()

fileName <- "./household_power_consumption.txt"
allData <- read.csv(fileName, header=TRUE, sep=";", stringsAsFactors=FALSE,
                    na.strings=c("NA", "-", " ", "?"))

# convert Date format

allData$Date <- as.Date(allData$Date, format="%d/%m/%Y") 

# subselect only two days data in February, 2007

subData <- subset(allData, Date >= "2007-02-01" & Date <= "2007-02-02")

# combine Date and Time together, and convert the format

dateTime <- paste(subData$Date, subData$Time)
subData$DateTime <- strptime(dateTime, format="%Y-%m-%d %H:%M:%S")

# create plots

# par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

par(mfrow = c(2,2))

with(subData, {
     # plot 1 in (1,1)
     plot(DateTime, Global_active_power, type = "l",
          xlab = "", ylab = "Global Active Power")
     
     # plot 2 in (1,2)
     plot(DateTime, Voltage, type = "l",
          xlab = "datetime", ylab = "voltage")
     
     # plot 3 in (2,1)
     plot(DateTime, Sub_metering_1, xlab = " ", 
                   ylab = "Energy sub metering", type = "n")
     lines(DateTime, Sub_metering_1, col = "black")
     lines(DateTime, Sub_metering_2, type = "l", col = "red")
     lines(DateTime, Sub_metering_3, type = "l", col = "blue")
     legend("topright", col = c("black", "red", "blue"), bty = "n",
            legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
     
     # plot 4 in (2,2)
     plot(DateTime, Global_reactive_power, type = "l",
          xlab = "datetime", ylab = "Global_reactive_power")
     
     })

# save plot into PNG file of 480 x 480

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
