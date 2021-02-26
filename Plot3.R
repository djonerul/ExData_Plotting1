d <- read.table("household_power_consumption.txt",
                sep = ";",
                header = T,
                #stringsAsFactors = T,
                na.strings = "?")

d <- transform(subset(d, Date=="1/2/2007"| Date =="2/2/2007"), 
               
               Date=format(as.Date(Date, format="%d/%m/%Y"),"%Y/%m/%d"),  
               
               Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))

png("plot3.png", width = 480, height = 480)

plot(as.POSIXct(paste(d$Date,d$Time)),
     d$Sub_metering_1,
     type = "n",
     xlab = "",
     ylab = "Energy sub Metering"
     )

lines(as.POSIXct(paste(d$Date,d$Time)),
     d$Sub_metering_1)

lines(as.POSIXct(paste(d$Date,d$Time)),
      d$Sub_metering_2,
      col = "red")

lines(as.POSIXct(paste(d$Date,d$Time)),
      d$Sub_metering_3,
      col = "blue")

legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty = 1)


dev.off()
