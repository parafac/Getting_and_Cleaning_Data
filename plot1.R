# This R code is for project assignment 1 of Coursera course on 
# Exploratory Data Analysis. It uses data (electric power consumptio) 
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

# plot histogram of Global_active_power

hist(subData$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col="Red")

# save plot into PNG file of 480 x 480

dev.copy(png, file="plot1.png", height=480, width=480)

dev.off()

