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

png("plot3.png", width = 480, height = 480)


#Plot 3
with(hhpower, {
  plot(hhpower$Sub_metering_1 ~ hhpower$datetime, 
       type= "l",
       xaxt = "n",
       xlab = "",
       ylab= "Energy sub metering",
       col = "black")
  lines(hhpower$Sub_metering_2 ~ hhpower$datetime, col="red", xaxt = "n")
  lines(hhpower$Sub_metering_3 ~ hhpower$datetime, col="blue", xaxt = "n")
})
ticks <- c(seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), by = "1 day"),
           max(hhpower$datetime))
axis.POSIXct(1, at = ticks, format = "%a")
legend("topright", pch = "____", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
