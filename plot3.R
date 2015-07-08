data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
small<-which(data$Date=="1/2/2007")
later<-which(data$Date=="2/2/2007")
total<-c(small,later)
newData<-data[total,]

dateTime<-paste(newData$Date,newData$Time)
ldate<-dmy_hms(dateTime)

png(filename = "plot3.png",width=480,height=480)  
with(newData,plot(ldate,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(newData,points(ldate,Sub_metering_2,type="l",col="red"))
with(newData,points(ldate,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,lwd=1,col=c("black","red","blue"), 
legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()  