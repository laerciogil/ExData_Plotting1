## Plot 4
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Coercing the datetime column
hpc$datetime <- paste(hpc$Date, hpc$Time)
hpc$datetime <- strptime(hpc$datetime, "%d/%m/%Y %H:%M:%S")

## Setting the device to png file
png(filename = "plot4.png", width = 480, height = 480, bg = "transparent")

## Setting layout
par(mfrow = c(2,2))

## 1 - Plotting the scatterplot to Global_active_power
with(hpc, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))

## 2 - Plotting the scatterplot to Voltage
with(hpc, plot(datetime, Voltage, type = "l"))

## 3 - Plotting the scatterplot to sub metering
## Plotting the empty scatterplot
plot(hpc$datetime, hpc$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
## Plotting the points
points(hpc$datetime, hpc$Sub_metering_1, type = "l")
points(hpc$datetime, hpc$Sub_metering_2, type = "l", col = "red")
points(hpc$datetime, hpc$Sub_metering_3, type = "l", col = "blue")
## Legend
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n", cex = 0.8)

## 4 - Plotting the scatterplot for Global_reactive_power
with(hpc, plot(datetime, Global_reactive_power, type = "l"))

## Closing the device
dev.off()

rm(list = ls())