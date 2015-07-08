data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
small<-which(data$Date=="1/2/2007")
later<-which(data$Date=="2/2/2007")
total<-c(small,later)
newData<-data[total,]

png(filename = "plot1.png",width=480,height=480)  
with(newData, hist(Global_active_power,main = "Global Active Power",col="red",xlab="Global Active Power (kilowatts)"))
dev.off()  
