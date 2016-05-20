library(sqldf)
# read requried data - 1st & 2nd Feb of 2007
df<- read.csv.sql(file = "household_power_consumption.txt", header=TRUE, sep=";", "select * from file where Date IN('1/2/2007','2/2/2007')")
#concatenate date & time
time <- paste(df$Date,df$Time)
#open & set device parameters
png(filename ="plot4.png", width = 480, height = 480)
#Setting plot layout parameters
par(mfrow=c(2,2))
#Graph 1
plot(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Global_active_power,type="l",ylab="Global Active Power",xlab = "") 
#Graph 2
plot(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Voltage,type="l",ylab="Voltage",xlab = "datetime") 
#Graph3
plot(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Sub_metering_1, type="l",ylab = "Energy sub metering", xlab = "")
lines(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Sub_metering_2, type = "l",col="red")
lines(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Sub_metering_3, type = "l",col="blue")
legend("topright",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1))
#Graph 4
plot(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab = "datetime")
#close device
dev.off()