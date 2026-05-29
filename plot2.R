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