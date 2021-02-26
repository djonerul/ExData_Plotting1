d <- read.table("household_power_consumption.txt",
                sep = ";",
                header = T,
                stringsAsFactors = T,
                na.strings = "?")

d <- subset(d, Date=="1/2/2007"| Date =="2/2/2007")

png("plot1.png", width = 480, height = 480)
  
  with(d, hist(Global_active_power, 
                 col = "red",
                 xlab = "Global Active Power (kilowatts)",
                 #yaxt = "n",
                 xaxt = "n",
                 xlim = c(0,7),
                 main = "Global Active Power",
                 breaks = 20
                 
  ))
  
  axis(1, at = c(0,2,4,6),labels = c(0,2,4,6))


dev.off() 