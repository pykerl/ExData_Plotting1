#load dataset with ; separators
df<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

## read in date/time info in format 'd/m/Y H:M:S'
dates <- df$Date
times <- df$Time
df$DateTime <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

#subset of dates
#2007-02-01 and 2007-02-02
df3 <- subset(df, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02'))

# Start PNG to save output to plot3.png
png(filename="plot3.png", height=480, width=480)

#Multi-plot of Energy sub metering
#Sub_metering_1 (black)
#Sub_metering_2 (red)
#Sub_metering_3 (blue)
plot(df3$DateTime,df3$Sub_metering_1,type="l",
     xlab="", ylab="Energy sub metering", col = "black")
lines(df3$DateTime,df3$Sub_metering_2, col = "red")
lines(df3$DateTime,df3$Sub_metering_3, col = "blue")

#change X-axis
axis.Date(1,at=df3$DateTime,labels=format(df3$DateTime,"%a"))

#add legend
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1, 1, 1))

# Turn off device (to flush to png)
dev.off()
