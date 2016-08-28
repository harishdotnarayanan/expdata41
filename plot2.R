
# CHANGE the location of txt file
pow <- read.table("../household_power_consumption.txt", sep = ';', 
                  header = TRUE, colClasses = c("character", "character", 
                                                "numeric", "numeric", "numeric", 
                                                "numeric", "numeric", "numeric", "numeric"), 
                  na.strings = c("?"))
pow$Date <- as.Date(pow$Date, format = "%d/%m/%Y")
pow <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02",]

with(pow, 
     plot(strptime(paste(pow$Date, pow$Time), format = "%Y-%m-%d %H:%M:%S"), 
          Global_active_power, type = "s", 
          ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, filename = "plot2.png", width = 480, height = 480, units = "px")
dev.off()