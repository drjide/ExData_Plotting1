library(tidyverse)
library(lubridate)

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipfile <- "power_data.zip"
txtfile <- "household_power_consumption.txt"

if(!file.exists(txtfile)){
  download.file(url, destfile = zipfile)
  unzip(zipfile)
}

hhpower <- read_delim("household_power_consumption.txt", 
                      delim = ";", na = "?") |> 
  filter(Date %in% c("1/2/2007", "2/2/2007")) |> 
  mutate(
    datetime = lubridate::dmy_hms(paste(Date, Time))
  )

png("plot2.png", width = 480, height = 480)


#Plot 2
plot(hhpower$Global_active_power ~ hhpower$datetime, 
     type= "l",
     xaxt = "n",
     xlab = "",
     ylab= "Global Active Power (kilowatts)")
ticks <- c(seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), by = "1 day"),
           max(hhpower$datetime))
axis.POSIXct(1, at = ticks, format = "%a")

dev.off() 
