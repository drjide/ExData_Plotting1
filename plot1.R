
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

png("plot1.png", width = 480, height = 480)

#Plot 1
with(hhpower, 
     hist(Global_active_power, 
          main="Global Active Power", 
          xlab= "Global Active Power (kilowatts)", 
          col="red")
)

dev.off() 