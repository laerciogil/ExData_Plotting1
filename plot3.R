## Plot 3
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Coercing the datetime column
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## Setting the device to png file
png(filename = "plot3.png", width = 480, height = 480)

## Plotting the scatterplot and adding more lines
with(hpc, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})

## Legend
legend("topright", col = c("black", "red", "blue"), legend = names(hpc)[7:9], lty = 1)

## Closing the device
dev.off()

rm(list = ls())