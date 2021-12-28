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

#create png file
png("plot1.png", width = 480, height = 480)

#plot
hist(power$Global_Active_Power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()