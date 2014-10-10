
source("read_in.R")

hw <- read_energy()

png(filename = "plot3.png", width = 480, height = 480)

hw$datetime <- as.POSIXct(paste(hw$Date, hw$Time), format="%d/%m/%Y %H:%M:%S")


with(hw, plot(datetime, Sub_metering_1, ylab="Energy sub metering", xlab="", type="n"))

with(hw, lines(datetime, Sub_metering_1, col="black"))
with(hw, lines(datetime, Sub_metering_2, col="red"))
with(hw, lines(datetime, Sub_metering_3, col="blue"))

legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"), cex = 0.9)

dev.off()