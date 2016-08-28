# CHANGE the location of txt file
pow <- read.table("../household_power_consumption.txt", sep = ';', 
                  header = TRUE, colClasses = c("character", "character", 
                                                "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "numeric"), 
                  na.strings = c("?"))
pow$Date <- as.Date(pow$Date, format = "%d/%m/%Y")
pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]

time <- strptime(paste(pow$Date, pow$Time), format = "%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
with(pow, 
     plot(time, 
          Global_active_power, type = "s", 
          ylab = "Global Active Power", xlab = ""))
with(pow, 
     plot(time, 
          Voltage, type = "s", 
          ylab = "Voltage", xlab = "datetime"))

with(pow, 
     plot(time, 
          Sub_metering_1, type = "s", 
          ylab = "Energy sub metering", xlab = ""))
lines(y = pow$Sub_metering_2, x = time, type = "s", col = "red")
lines(y = pow$Sub_metering_3, x = time, type = "s", col = "blue")

legend("top", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty =1, lwd =1, bty = "n")

with(pow, 
     plot(time, 
          Global_reactive_power, type = "s", 
          xlab = "datetime"))


dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()