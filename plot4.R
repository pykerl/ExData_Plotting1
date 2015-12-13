#load dataset with ; separators
df<-read.csv("household_power_consumption.txt",sep = ";",na.strings = "?")

## read in date/time info in format 'd/m/Y H:M:S'
dates <- df$Date
times <- df$Time
df$DateTime <- strptime(paste(dates, times), "%d/%m/%Y %H:%M:%S")

#subset of dates
#2007-02-01 and 2007-02-02
df3 <- subset(df, format(DateTime,'%Y-%m-%d') %in% c('2007-02-01','2007-02-02'))

# Start PNG to save output to plot4.png
png(filename="plot4.png", height=480, width=480)

#set up 2x2 plot
par(mfrow=c(2,2))

##plot 1##
#Plot over time of Global_active_power (kilowatts) for Thu / Fri / Sat
plot(df3$DateTime,df3$Global_active_power,type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
#change X-axis
axis.Date(1,at=df3$DateTime,labels=format(df3$DateTime,"%a"))

##plot 2##
#Voltage plot
#Plot over time of Global_active_power (kilowatts) for Thu / Fri / Sat
plot(df3$DateTime,df3$Voltage,type="l",
     xlab="datetime", ylab="Voltage")
#change X-axis
axis.Date(1,at=df3$DateTime,labels=format(df3$DateTime,"%a"))


##plot 3##
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
       col = c("black","red","blue"), lty = c(1, 1, 1),  bty = "n")

##plot 4##
#Global_reactive_power plot
#Plot over time of Global_active_power (kilowatts) for Thu / Fri / Sat
plot(df3$DateTime,df3$Global_reactive_power,type="l",
     xlab="datetime", ylab="Global_reactive_power")
#change X-axis
axis.Date(1,at=df3$DateTime,labels=format(df3$DateTime,"%a"))


# Turn off device (to flush to png)
dev.off()
