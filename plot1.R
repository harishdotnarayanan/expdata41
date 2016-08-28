## plot1.R
##
## Generates the first plot for Assignment 1

# Reading the master file to a data frame
pow <- read.table("./household_power_consumption.txt", sep = ';', 
                  header = TRUE, colClasses = c("character", "character", 
                                                "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "numeric"), 
                  na.strings = c("?"))

# Subsetting to only the required dates
pow$Date <- as.Date(pow$Date, format = "%d/%m/%Y")
pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]

# Drawing histogram of the Global Active Power data
par(mar = c(5,4,4,2), mfrow=c(1,1))
hist(pow$Global_active_power, main = "Global Active Power", 
     col = "red", xlab = "Global Active Power (kilowatts)")

# Copying histogram output to file
if(!dir.exists("./figures")) {
  dir.create("./figures")
}
dev.copy(png, filename = "./figures/plot1.png", width = 480, height = 480, units = "px")
dev.off()