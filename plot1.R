#load dataset with ; separators
df<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

## read in date/time info in format 'd/m/Y H:M:S'
dates <- df$Date
times <- df$Time
df$DateTime <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

#subset of dates
#2007-02-01 and 2007-02-02
df3 <- subset(df, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02'))


# Start PNG to save output to plot1.png
png(filename="plot1.png", height=480, width=480)

#Histogram of Global_active_power for those dates
hist(df3$Global_active_power[!is.na(df3)],
     xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red")


# Turn off device (to flush to png)
dev.off()
