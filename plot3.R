library(dplyr)

##
## Load and prepare dataset
##
dat <- read.table("household_power_consumption.txt", header = T, sep = ";")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
X <- filter(dat, Date == "2007-02-01" | Date == "2007-02-02")
rm(dat)

##
## Subset data for histogram
##
datetime <- as.POSIXct(paste(X$Date, X$Time))
sub1 <- as.numeric(as.character(X$Sub_metering_1))
sub2 <- as.numeric(as.character(X$Sub_metering_2))
sub3 <- as.numeric(as.character(X$Sub_metering_3))

##
## Create plot and write PNG file
##
png(filename = "plot3.png")
plot(sub1~datetime, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(sub2~datetime, type = "l", col = "red")
lines(sub3~datetime, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "—")
dev.off()
