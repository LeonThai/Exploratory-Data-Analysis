library(date)

data = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

data$Date = as.Date(data$Date, "%d/%m/%Y")
dataFiltered = subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

##### Plot 2
png("plot2.png", width=480, height=480)
Date_and_time = as.POSIXct(paste(dataFiltered$Date, dataFiltered$Time, sep=" "))
plot(Date_and_time, dataFiltered$Global_active_power, type="l", xlab="" , ylab="Global Active Power (kilowatts)")
dev.off()
