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
GAP <- as.numeric(as.character(X$Global_active_power))

##
## Create plot and write PNG file
##
png(filename = "plot2.png")
plot(GAP~datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
