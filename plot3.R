library(date)

data = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

data$Date = as.Date(data$Date, "%d/%m/%Y")
dataFiltered = subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##### Plot 3
png("plot3.png", width=480, height=480)
plot(Date_and_time, as.numeric(dataFiltered$Sub_metering_1), type = "l",xlab = "", ylab = "Energy Submetering")
lines(Date_and_time, as.numeric(dataFiltered$Sub_metering_2), col = "red")
lines(Date_and_time, as.numeric(dataFiltered$Sub_metering_3), col = "blue")
legend("topright", col=c("black","red","blue"), lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
