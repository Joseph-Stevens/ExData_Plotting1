# Read data in

data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)

# Subset data to Feb 1 and 2 (d/m/y format)

small<-which(data$Date=="1/2/2007")
later<-which(data$Date=="2/2/2007")
total<-c(small,later)
newData<-data[total,]

# Use lubridate to get a consistant date and time format

library(lubridate)
dateTime<-paste(newData$Date,newData$Time)
datetime<-dmy_hms(dateTime)

# Create png, dimensions 480 x 480

png(filename = "plot4.png",width=480,height=480)  

# place plots in 2 x 2 grid
par(mfrow = c(2,2))

# generate plot1 (same as plot2.png)

with(newData,{
  plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  
# generate plot2 (Voltage)

  plot(datetime,Voltage,type="l")

# generate plot3 (same as plot3.png)

  plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  points(datetime,Sub_metering_2,type="l",col="red")
  points(datetime,Sub_metering_3,type="l",col="blue")
   legend("topright",bty="n",lty=1,lwd=1,col=c("black","red","blue"), 
     legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# generate plot4 (Global_reactive_power)

  plot(datetime,Global_reactive_power,type="l")
})

# Close png

dev.off()  