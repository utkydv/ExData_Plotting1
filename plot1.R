library(sqldf)
# read requried data - 1st & 2nd Feb of 2007
df<- read.csv.sql(file = "household_power_consumption.txt", header=TRUE, sep=";", "select * from file where Date IN('1/2/2007','2/2/2007')")
#open & set device parameters
png(filename ="plot1.png", width = 480, height = 480)
#Graph 
hist(df$Global_active_power, col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
#close device
dev.off()