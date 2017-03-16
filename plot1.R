library(date)

data = read.table("household_power_consumption.txt", sep = ";", header = T, stringsAsFactors = F)

data$Date = as.Date(data$Date, "%d/%m/%Y")
dataFiltered = subset(data, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


##### Plot 1
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(dataFiltered$Global_active_power)), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
