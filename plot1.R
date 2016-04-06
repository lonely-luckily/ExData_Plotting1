library(dplyr)

## Load and prepare dataset
dat <- read.table("household_power_consumption.txt", header = T, sep = ";")
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
X <- filter(dat, Date == "2007-02-01" | Date == "2007-02-02")

## Subset data for histogram and create the plot
GAP <- as.numeric(as.character(X$Global_active_power))

png(filename = "plot1.png")
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
