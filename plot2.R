library(sqldf)
# read requried data - 1st & 2nd Feb of 2007
df<- read.csv.sql(file = "household_power_consumption.txt", header=TRUE, sep=";", "select * from file where Date IN('1/2/2007','2/2/2007')")
#concatenate date & time
time <- paste(df$Date,df$Time)
#open & set device parameters
png(filename ="plot2.png", width = 480, height = 480)
#Graph 
plot(strptime(time,"%d/%m/%Y %H:%M:%S"), df$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab = "") 
#close device
dev.off()
