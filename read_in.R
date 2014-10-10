read_energy <- function() {
    
    setwd("c:/coursera/EDA/proj1")
    htest <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, nrows = 2,
                na.strings="?",colClasses = c("character","character","double","double", "double", "double","double",
                                              "double","double")
    );
    
heads <- names(htest)

file_day_1 <- as.POSIXct(paste(htest$Date[1],htest$Time[1]), format="%d/%m/%Y %H:%M:%S")
our_day_1 <- as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")

days_in <- our_day_1 - file_day_1
minutes_per_day <- 1440
minutes_in <- days_in * minutes_per_day
first_line <- minutes_in + 1

h <- read.table("household_power_consumption.txt", sep=";", header = FALSE, stringsAsFactors = FALSE, skip = first_line, nrows = 2880,
                    na.strings="?",colClasses = c("character","character","double","double", "double", "double","double",
                                                  "double","double")
);
#col.names = c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "submetering1", "submetering2", "submetering3"),

#We're interested in starting at line 66638 and foing for 2880 rows,
#but I figured that out outside of R

#    d <- strptime(h$Date, format="%d/%m/%Y")


    day1 <- strptime("01/02/2007",format="%d/%m/%Y")
    day2 <- strptime("02/02/2007",format="%d/%m/%Y")

    #hw1 <- h[d == day1, ]
   # hw2 <- h[d == day2, ]
  #  hw <- rbind(hw1, hw2)
names(h) <- heads
    return(h)
}
