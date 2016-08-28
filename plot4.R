## plot4.R
##
## Generates the fourth plot for Assignment 1

# Reading the master file to a data frame
pow <- read.table("./household_power_consumption.txt", sep = ';', 
                  header = TRUE, colClasses = c("character", "character", 
                                                "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "numeric"), 
                  na.strings = c("?"))

# Subsetting to only the required dates
pow$Date <- as.Date(pow$Date, format = "%d/%m/%Y")
pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]

# Saving the concatenated date and time to the datetime variable
datetime <- strptime(paste(pow$Date, pow$Time), format = "%Y-%m-%d %H:%M:%S")

# Setting the view so that 4 graphs can be plotted
par(mfrow = c(2,2))

# Plotting graph 1
with(pow, 
     plot(datetime, 
          Global_active_power, type = "s", 
          ylab = "Global Active Power", xlab = ""))

# Plotting graph 2
with(pow, 
     plot(datetime, 
          Voltage, type = "s", 
          ylab = "Voltage"))

# Plotting graph 3
with(pow, 
     plot(datetime, 
          Sub_metering_1, type = "s", 
          ylab = "Energy sub metering", xlab = ""))
lines(y = pow$Sub_metering_2, x = datetime, type = "s", col = "red")
lines(y = pow$Sub_metering_3, x = datetime, type = "s", col = "blue")

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty =1, lwd =1, bty = "n", inset = 0.11, cex = 0.7)


# Plotting graph 4
with(pow, 
     plot(datetime, 
          Global_reactive_power, type = "s"))

# Copying plot output to file
if(!dir.exists("./figures")) {
  dir.create("./figures")
}
dev.copy(png, filename = "./figures/plot4.png", width = 480, height = 480, units = "px")
dev.off()