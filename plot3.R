## plot3.R
##
## Generates the third plot for Assignment 1

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

# Drawing the plot for the Sub_metering_1
par(mar = c(5,4,4,2), mfrow=c(1,1))
with(pow, 
     plot(datetime, 
          Sub_metering_1, type = "s", 
          ylab = "Energy sub metering", xlab = ""))

# Adding the Sub_metering_2 and Sub_metering_3 graph to the same plot
lines(y = pow$Sub_metering_2, x = datetime, type = "s", col = "red")
lines(y = pow$Sub_metering_3, x = datetime, type = "s", col = "blue")

# Adding the legend
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty =1, lwd =1)

# Copying plot output to file
if(!dir.exists("./figures")) {
  dir.create("./figures")
}
dev.copy(png, filename = "./figures/plot3.png", width = 480, height = 480, units = "px")
dev.off()