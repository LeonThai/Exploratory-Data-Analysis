library(date)

data = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

data$Date = as.Date(data$Date, "%d/%m/%Y")
dataFiltered = subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#### Plot 4
png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

plot(Date_and_time, as.numeric(as.character(dataFiltered$Global_active_power)), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(Date_and_time, as.numeric(as.character(dataFiltered$Voltage)), type="l", xlab="", ylab="Voltage")

plot(Date_and_time, as.numeric(dataFiltered$Sub_metering_1), type = "l",xlab = "", ylab = "Energy Submetering")
lines(Date_and_time, as.numeric(dataFiltered$Sub_metering_2), col = "red")
lines(Date_and_time, as.numeric(dataFiltered$Sub_metering_3), col = "blue")
legend("topright", col=c("black","red","blue"), lty = 1, legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(Date_and_time, as.numeric(dataFiltered$Global_reactive_power), type="l", xlab="", ylab="Global_reactive_power")

dev.off()


