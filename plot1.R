setwd("c:/coursera/EDA/proj1")
h <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE,
               na.strings="?",colClasses = c("character","character","double","double", "double", "double","double",
                               "double","double")
                );

#col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "submetering1", "submetering2", "submetering3"),

#We're interested in starting at line 66638 and foing for 2880 rows,
#but I figured that out outside of R

d <- strptime(h$Date, format="%d/%m/%Y")


day1 <- strptime("01/02/2007",format="%d/%m/%Y")
day2 <- strptime("02/02/2007",format="%d/%m/%Y")

hw1 <- h[d == day1, ]
hw2 <- h[d == day2, ]
hw <- rbind(hw1, hw2)


png(filename = "plot1.png", width = 480, height = 480)

hist(hw$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")

dev.off()
# as.Date()