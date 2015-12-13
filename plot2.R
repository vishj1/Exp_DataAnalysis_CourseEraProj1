plot2 <- function()
{
   # Read the data from the household_power_consumption.txt
   pwdata<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
   reqData<-subset(pwdata, pwdata$Date=="1/2/2007"| pwdata$Date=="2/2/2007")
   png(filename = "plot2.png", width = 480, height = 480)
   reqData1<-reqData
   reqData1$DateTime<-as.POSIXct(paste(reqData1$Date, reqData1$Time), format="%d/%m/%Y %H:%M:%S")
   with(reqData1, plot(DateTime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))
  
   dev.off()
}