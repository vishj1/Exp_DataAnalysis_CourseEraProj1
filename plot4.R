plot4 <- function()
{
   # Read the data from the household_power_consumption.txt
   pwdata<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
   reqData<-subset(pwdata, pwdata$Date=="1/2/2007"| pwdata$Date=="2/2/2007")
   png(filename = "plot4.png", width = 480, height = 480)
   reqData1<-reqData
   reqData1$DateTime<-as.POSIXct(paste(reqData1$Date, reqData1$Time), format="%d/%m/%Y %H:%M:%S")
   
   
   par(mfrow = c(2, 2))
   
   with(reqData1, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power"))
   
   with(reqData1, plot(DateTime, Voltage, type="l", xlab = "datetime", ylab = "Voltage"))
   
   with(reqData1, plot(DateTime, Sub_metering_1, type="l", xlab = "", ylab = "Energy Sub metering"))
   with(reqData1, lines(DateTime, Sub_metering_2, type="l", col="red"))
   with(reqData1, lines(DateTime, Sub_metering_3, type="l", col="blue"))
   legend("topright", pch = 1, col = c("black","red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   
   with(reqData1, plot(DateTime, Global_reactive_power, type="l", xlab = "datetime", ylab = "Global_reactive_power"))
   
   dev.off()
}