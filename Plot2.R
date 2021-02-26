d <- read.table("household_power_consumption.txt",
                sep = ";",
                header = T,
                #stringsAsFactors = T,
                na.strings = "?")

d <- transform(subset(d, Date=="1/2/2007"| Date =="2/2/2007"), 
          
          Date=format(as.Date(Date, format="%d/%m/%Y"),"%Y/%m/%d"),  
          
          Time=format(strptime(Time, format="%H:%M:%S"),"%H:%M:%S"))

png("plot2.png", width = 480, height = 480)

  plot(as.POSIXct(paste(d$Date,d$Time)),
       d$Global_active_power,
       type = "l",
       xlab = "",
       ylab = "Global Active Power (kilowatts)")

dev.off()
