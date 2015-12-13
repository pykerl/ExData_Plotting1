#load dataset with ; separators
df<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

## read in date/time info in format 'd/m/Y H:M:S'
dates <- df$Date
times <- df$Time
df$DateTime <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

#subset of dates
#2007-02-01 and 2007-02-02
df3 <- subset(df, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02'))

# Start PNG to save output to plot2.png
png(filename="plot2.png", height=480, width=480)

#Plot over time of Global_active_power (kilowatts) for Thu / Fri / Sat
plot(df3$DateTime,df3$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
#change X-axis
axis.Date(1,at=df3$DateTime,labels=format(df3$DateTime,"%a"))

# Turn off device (to flush to png)
dev.off()
