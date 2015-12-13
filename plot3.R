library(dplyr)

power <- read.table("household_power_consumption.txt", na.strings="?",
                    as.is=TRUE, header=TRUE, sep=";")

power <- power %>%
  mutate(datetime = as.POSIXct(strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")),
         Date = as.Date(power$Date, "%d/%m/%Y")) %>%
  filter(Date >= as.Date("2007-02-01", "%Y-%m-%d") & Date <= as.Date("2007-02-02", "%Y-%m-%d")) %>%
  arrange(datetime)

png("plot3.png")
with(power, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(power, points(datetime, Sub_metering_1, type="l"))
with(power, points(datetime, Sub_metering_2, type="l", col="red"))
with(power, points(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))
dev.off()