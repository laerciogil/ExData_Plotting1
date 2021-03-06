## Plot 1
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Setting the device to png file
png(filename = "plot1.png", width = 480, height = 480)

## Plotting the histogram
with(hpc, 
     hist(Global_active_power, 
          col = "red", 
          main = "Global Active Power", 
          xlab = "Global Active Power (kilowatts)"))

## Closing the device
dev.off()

rm(list = ls())