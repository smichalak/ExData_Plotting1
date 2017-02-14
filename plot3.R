# for geeting the English weekdays
Sys.setlocale("LC_TIME", "English")

# read ds
ds <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# format date
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

#grab the first two days in February
ds_n <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#create datetime
ds_n$Datetime <- as.POSIXct(paste(as.Date(ds_n$Date), ds_n$Time))

# plot for view and add multiple lines
plot(ds_n$Sub_metering_1~ds_n$Datetime, type="l", ylab="Energie sub metering", xlab="")
lines(ds_n$Sub_metering_2~ds_n$Datetime, col="red")
lines(ds_n$Sub_metering_3~ds_n$Datetime, col="blue")
legend(
    "topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()