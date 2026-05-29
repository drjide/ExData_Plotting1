png("plot4.png", width = 480, height = 480)


#Plot 4
par(mfrow = c(2, 2), mar = c(4,4,2,1), oma = c(0,0,2,0))
#1
plot(hhpower$Global_active_power ~ hhpower$datetime, 
     type= "l",
     xaxt = "n",
     xlab = "",
     ylab= "Global Active Power")
ticks <- c(seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), by = "1 day"),
           max(hhpower$datetime))
axis.POSIXct(1, at = ticks, format = "%a")

#2
plot(hhpower$Voltage ~ hhpower$datetime, 
     type= "l",
     xaxt = "n",
     yaxt = "n",
     xlab = 'datetime',
     ylab= "Voltage")
ticks <- c(seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), by = "1 day"),
           max(hhpower$datetime))
axis.POSIXct(1, at = ticks, format = "%a")
axis(2, at = pretty(hhpower$Voltage), labels = format(pretty(hhpower$Voltage), scientific = FALSE))

#axis(2, at = seq(234,246, by = 4))  

#3
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
legend("topright", 
       lty = 1, 
       col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.8,
       bty = "n")

#4
plot(hhpower$Global_reactive_power~ hhpower$datetime, 
     type= "l",
     xaxt = "n",
     xlab = "datetime",
     ylab = "Global_reactive_power")
ticks <- c(seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-02"), by = "1 day"),
           max(hhpower$datetime))
axis.POSIXct(1, at = ticks, format = "%a")


dev.off() 