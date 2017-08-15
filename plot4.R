## Plot 4
source("download.R")

## Open data and subset
hpc <- read.csv(file.path("Dataset","household_power_consumption.txt"), sep = ";", na.strings = "?")
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),]

## Coercing the datetime column
hpc$datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")

## Setting the device to png file
png(filename = "plot4.png", width = 480, height = 480)

## Setting layout
par(mfrow = c(2,2))

## 1 - Plotting the scatterplot to Global_active_power
with(hpc, 
     plot(datetime, 
          Global_active_power, 
          type = "l", 
          xlab = "", 
          ylab = "Global Active Power "))

## 2 - Plotting the scatterplot to Voltage
with(hpc, 
     plot(datetime, 
          Voltage, 
          type = "l"))

## 3 - Plotting the scatterplot to sub metering
## Plotting the scatterplot and adding more lines
with(hpc, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, col = "red")
  lines(datetime, Sub_metering_3, col = "blue")
})
## Legend
legend("topright", col = c("black", "red", "blue"), legend = names(hpc)[7:9], lty = 1, cex = 0.7, bty = "n")

## 4 - Plotting the scatterplot for Global_reactive_power
with(hpc, 
     plot(datetime, 
          Global_reactive_power, 
          type = "l"))

## Closing the device
dev.off()

rm(list = ls())