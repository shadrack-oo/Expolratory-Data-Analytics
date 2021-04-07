##Assignment 1 
##Plotting Dataset: Electric power consumption

#First Plot
data <- unzip( "exdata_data_household_power_consumption.zip" )
data1 <- read.csv(data, sep = ";")

#Creating a Subset of dates 2007-02-01 and 2007-02-02 for Correct Data Limit

data2 <- subset(data1 , Date=="1/2/2007" | Date== "2/2/2007")

#Plot #1
data2$Global_active_power <- as.numeric(data2$Global_active_power)
png("plot1.png" ,width = 480 , height = 480)
with(data2 , hist(Global_active_power , col = "green" , main ="Global Active Power" , xlab = "Global Active Power (kilowatts)" ))
dev.off()

#Second Plot
#Plot #2
data2$Global_active_power <- as.numeric(data2$Global_active_power)

data2$Date <- as.Date(data2$Date, format ="%d/%m/%Y" )
data2$datetime <- as.POSIXct(paste(data2$Date , data2$Time) , format="%Y-%m-%d %H:%M:%S")

Sys.setenv("LANGUAGE"="En")
Sys.setlocale("LC_ALL", "English")
png("plot2.png" ,width = 480 , height = 480)
with(data2 , plot(data2$datetime ,data2$Global_active_power, type = "l",xlab = "",ylab = "Global Active Power (kilowatts)" , main ="Global Active Power Vs Time"  ))
dev.off()


#Third Plot
#Plot #3
data2$Sub_metering_1 <- as.numeric(data2$Sub_metering_1)
data2$Sub_metering_2 <- as.numeric(data2$Sub_metering_2)

data2$Date <- as.Date(data2$Date, format ="%d/%m/%Y" )
data2$datetime <- as.POSIXct(paste(data2$Date , data2$Time) , format="%Y-%m-%d %H:%M:%S")


png("plot3.png" ,width = 480 , height = 480)
with(data2 , plot(datetime ,Sub_metering_1 , xlab = "" , ylab = "Energy sub metering" , type = "l" ))
with(data2 , lines(datetime ,Sub_metering_2 , col="green" ))
with(data2 , lines(datetime ,Sub_metering_3 , col="pink" ))
legend("topright", lty=1, col=c("green","pink","yellow"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.off()


#Fouth Plot
#Plot# 4


data2$Global_active_power <- as.numeric(data2$Global_active_power)
data2$Voltage <- as.numeric(data2$Voltage)
data2$Global_reactive_power <- as.numeric(data2$Global_reactive_power)



png("plot4.png" ,width = 480 , height = 480)
par(mfrow=c(2,2))
with(data2,{
  plot(datetime,Global_active_power,type="l",  xlab="",ylab="Global Active Power")  
  plot(datetime,Voltage, type="l",xlab="datetime",ylab="Voltage")
  plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  lines(datetime,Sub_metering_2,col="green")
  lines(datetime,Sub_metering_3,col="blue")
  legend("topright", lty=1, col=c("yellow","pink","green"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n", cex = 0.5)
  plot(datetime,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})
dev.off()
