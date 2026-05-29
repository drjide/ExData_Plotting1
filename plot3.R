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