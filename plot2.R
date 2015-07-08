data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
small<-which(data$Date=="1/2/2007")
later<-which(data$Date=="2/2/2007")
total<-c(small,later)
newData<-data[total,]

dateTime<-paste(newData$Date,newData$Time)
ldate<-dmy_hms(dateTime)

png(filename = "plot2.png",width=480,height=480)  
plot(ldate,newData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()  