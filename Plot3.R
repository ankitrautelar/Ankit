data<-read.csv("P:/R/household_power_consumption.txt",header=TRUE,sep = ';')

data1<-subset(data,Date=="1/2/2007")

data2<-subset(data,Date=="2/2/2007")

datanew<-rbind(data1,data2)

datanew1<-mutate(datanew, DateTime=paste(datanew$Date,datanew$Time))

datanew1$DateTime <- strptime(paste(datanew1$Date, datanew1$Time), format="%d/%m/%Y %H:%M:%S")

dates<-unique(datanew1$Date)


startday<-strptime(dates[1],format="%d/%m/%Y")


endday<-strptime("03/02/2007",format="%d/%m/%Y")

label<-c(weekdays(seq(startday, endday, by="day")))

for(i in 1:length(label))
{

label[i]<-substr(label[i],1,3)
}

names(datanew1)<-gsub("_","",names(datanew1))

png("Plot3.png", width = 480, height = 480, units = "px", bg = "white")




plot((datanew1$DateTime), as.numeric(datanew1$Submetering1),type="n",
, xaxt="n",xlab="",ylab="Energy sub metering")

points(datanew1$DateTime,datanew1$Submetering1, type="l")

points(datanew1$DateTime,datanew1$Submetering2, type="l",col="red")

points(datanew1$DateTime,datanew1$Submetering3, type="l",col="blue")


axis(1,at=seq(startday, endday, by="day"),labels=label)


legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2,2,2), col=c("black","red","blue"))

dev.off()