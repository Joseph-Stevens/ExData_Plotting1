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

png(filename = "plot2.png",width=480,height=480)  

# Create plot

plot(ldate,newData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")

# Close png

dev.off()  