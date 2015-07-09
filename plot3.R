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
ldate<-dmy_hms(dateTime)

# Create png, dimensions 480 x 480

png(filename = "plot3.png",width=480,height=480)  

# Create plot, Sub Metering 1

with(newData,plot(ldate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))

# add Sub Metering 2

with(newData,points(ldate,Sub_metering_2,type="l",col="red"))

# add Sub Metering 3

with(newData,points(ldate,Sub_metering_3,type="l",col="blue"))

# add legend

legend("topright",lty=1,lwd=1,col=c("black","red","blue"), 
legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close png

dev.off()  