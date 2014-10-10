
source("read_in.R")

hw <- read_energy()

png(filename = "plot2.png", width = 480, height = 480)

hw$datetime <- as.POSIXct(paste(hw$Date, hw$Time), format="%d/%m/%Y %H:%M:%S")

plot(hw$datetime, hw$Global_active_power, main="Global Active Power",ylab="Global Active Power(kilowatts)", type="n")

lines(hw$datetime, hw$Global_active_power)

dev.off()