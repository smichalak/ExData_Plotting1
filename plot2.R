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

# plot for view
plot(ds_n$Global_active_power~ds_n$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()