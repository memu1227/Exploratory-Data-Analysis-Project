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
SM1<-as.numeric(power$Sub_Metering_1)
SM2<-as.numeric(power$Sub_Metering_2)
SM3<-as.numeric(power$Sub_Metering_3)

#open png
png("plot3.png", width = 480,height = 480)

#plot
plot(datetime, SM1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(datetime,SM2, col = "red")
lines(datetime,SM3, col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        lwd = 1.2,col = c("black","red","blue"))

dev.off()