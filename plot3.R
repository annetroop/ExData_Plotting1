
source("read_in.R")

hw <- read_energy()

png(filename = "plot3.png", width = 480, height = 480)

hw$datetime <- as.POSIXct(paste(hw$Date, hw$Time), format="%d/%m/%Y %H:%M:%S")

plot(hw$datetime, hw$Sub_metering_1, main="Global Active Power",ylab="Global Active Power(kilowatts)", type="n")

lines(hw$datetime, hw$Sub_metering_1, col="black")
lines(hw$datetime, hw$Sub_metering_2, col="red")
lines(hw$datetime, hw$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

dev.off()