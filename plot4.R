source("read_in.R")

hw <- read_energy()
hw$datetime <- as.POSIXct(paste(hw$Date, hw$Time), format="%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

with(hw, plot(datetime, Global_active_power,ylab="Global Active Power", xlab="", type="n"))
with(hw, lines(datetime, Global_active_power))

with(hw, plot(datetime, Voltage, ylab="Voltage", type="n"))
with(hw, lines(datetime, Voltage))

with(hw, plot(datetime, Sub_metering_1, ylab="Energy Submetering", xlab="", type="n"))
with(hw, lines(datetime, Sub_metering_1, col="black"))
with(hw, lines(datetime, Sub_metering_2, col="red"))
with(hw, lines(datetime, Sub_metering_3, col="blue"))
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), cex=0.7, bty="n")


with(hw, plot(datetime, Global_reactive_power, type="n"))
with(hw, lines(datetime, Global_reactive_power))

dev.off()