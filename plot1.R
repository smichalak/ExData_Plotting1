# read ds
ds <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")

# format date
ds$Date <- as.Date(ds$Date, format="%d/%m/%Y")

#grab the first two days in February
ds_n <- subset(ds, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
#print(str(ds_n))

# plot for view
hist(ds_n$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# save to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()