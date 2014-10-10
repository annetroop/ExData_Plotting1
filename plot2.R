
source("read_in.R")

hw <- read_energy()

png(filename = "plot2.png", width = 480, height = 480)

hw$datetime <- as.POSIXct(paste(hw$Date, hw$Time), format="%d/%m/%Y %H:%M:%S")

with(hw,plot(datetime, Global_active_power, ylab="Global Active Power (kilowatts)", xlab = "", type="n"))
with(hw, lines(datetime, Global_active_power))

dev.off()