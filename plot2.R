## Plot 2
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Coercing the datetime column
hpc$datetime <- paste(hpc$Date, hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S")

## Setting the device to png file
png(filename = "plot2.png", width = 480, height = 480, bg = "transparent")

## Plotting the scatterplot
with(hpc, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Closing the device
dev.off()

rm(list = ls())