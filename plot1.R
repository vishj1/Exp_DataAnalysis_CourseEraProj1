plot1 <- function()
{
   # Read the data from the household_power_consumption.txt
   pwdata<-read.table("exdata_data_household_power_consumption/household_power_consumption.txt", header=TRUE, sep = ";", na.strings="?")
   reqData<-subset(pwdata, pwdata$Date=="1/2/2007"| pwdata$Date=="2/2/2007")
   png(filename = "plot1.png", width = 480, height = 480)
   with(reqData, hist(Global_active_power, main="Global Active Power", col="red", xlab = "Global Active Power (kilowatts)"))
   dev.off()
}