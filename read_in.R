read_energy <- function() {
  
  #read in the top of the file to find out the headers and first date
  htest <- read.table("household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE, nrows = 2,
                na.strings="?",colClasses = c("character","character","double","double", "double", "double","double",
                                              "double","double")
  );
    
  heads <- names(htest)

  # calculate how far in the dates we're interested in are
  file_day_1 <- as.POSIXct(paste(htest$Date[1],htest$Time[1]), format="%d/%m/%Y %H:%M:%S")
  our_day_1 <- as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")

  days_in <- our_day_1 - file_day_1
  minutes_per_day <- 1440
  minutes_in <- days_in * minutes_per_day
  first_line <- minutes_in + 1

  #only read the lines we're interested in
  h <- read.table("household_power_consumption.txt", sep=";", header = FALSE, stringsAsFactors = FALSE, skip = first_line, nrows = 2880,
          na.strings="?",colClasses = c("character","character","double","double", "double", "double","double",
                                                  "double","double")
      );

names(h) <- heads
    return(h)
}
