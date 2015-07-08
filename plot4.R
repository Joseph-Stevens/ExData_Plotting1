data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
small<-which(data$Date=="1/2/2007")
later<-which(data$Date=="2/2/2007")
total<-c(small,later)
newData<-data[total,]

dateTime<-paste(newData$Date,newData$Time)
datetime<-dmy_hms(dateTime)

png(filename = "plot4.png",width=480,height=480)  
par(mfrow = c(2,2))
with(newData,{
  plot(datetime,Global_active_power,type="l",xlab="",ylab="Global Active Power")
  plot(datetime,Voltage,type="l")
  plot(datetime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
  points(datetime,Sub_metering_2,type="l",col="red")
  points(datetime,Sub_metering_3,type="l",col="blue")
   legend("topright",bty="n",lty=1,lwd=1,col=c("black","red","blue"), 
     legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(datetime,Global_reactive_power,type="l")
})
dev.off()  