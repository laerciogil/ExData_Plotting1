## Checking if the content folder exists and create it
folderPath <- "./Dataset"

if(!file.exists(folderPath))
  dir.create(folderPath, recursive = TRUE)

## Download and unzip data files
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
filePath <- file.path(folderPath, "Dataset.zip")

if(!file.exists(filePath) | !file.exists(file.path(folderPath, "household_power_consumption.txt"))) {
  download.file(fileUrl, filePath, mode = "wb")
  unzip(filePath, exdir = folderPath)
}