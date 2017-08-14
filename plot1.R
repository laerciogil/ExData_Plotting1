## Plot 1
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Setting the device to png file
png(filename = "plot1.png", width = 480, height = 480, bg = "transparent")

## Plotting the histogram
with(hpc, hist(Global_active_power, col = "red", main = NULL, xlab = NULL, ylab = NULL))

## Setting the title and the axis labels
title(main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Closing the device
dev.off()

rm(list = ls())