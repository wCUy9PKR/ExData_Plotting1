library(dplyr)

power <- read.table("household_power_consumption.txt", na.strings="?",
                    as.is=TRUE, header=TRUE, sep=";")

power <- power %>%
  mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
         Date = as.Date(power$Date, "%d/%m/%Y")) %>%
  filter(Date >= as.Date("2007-02-01", "%Y-%m-%d") & Date <= as.Date("2007-02-02", "%Y-%m-%d")) %>%
  arrange(datetime)

png("plot2.png")
with(power, plot(datetime, Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"))
dev.off()