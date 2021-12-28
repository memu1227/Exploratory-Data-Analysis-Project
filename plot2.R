##load necessary libraries
library(tidyverse)

filename <- "exdata_data_household_power_consumption.zip"

##unzip file
unzip(filename)

#read file 
power <- read.table(text = grep("^[1,2]/2/2007",
         readLines("household_power_consumption.txt"),value = TRUE),
         col.names = c("Date","Time","Global_Active_Power","Global_Reactive_Power",
         "Voltage","Global_Intensity","Sub_Metering_1","Sub_Metering_2", 
         "Sub_Metering_3"), sep = ";",header = TRUE)

#putting data in appropriate format
datetime<- strptime(paste(power$Date, power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(power$Global_Active_Power)

#opening up png
png("plot2.png", width = 480, height = 480)

#plot
plot(datetime,GAP, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()
