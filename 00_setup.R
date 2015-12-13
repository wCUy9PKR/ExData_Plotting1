# Download and Setup Data
#
# This script downloads the source data file from the class website.
# After it is run, the file will be available as household_power_consumption.txt
setwd("/home/coursera/ExData_Plotting1/")
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, "power.zip", method="curl")
unzip("power.zip")