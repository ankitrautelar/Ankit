
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

png("Plot2.png", width = 480, height = 480, units = "px", bg = "white")





plot((datanew1$DateTime), as.numeric(datanew1$Globalactivepower)/500,type="l",
, xaxt="n",xlab="",ylab="Global Active Power")


axis(1,at=seq(startday, endday, by="day"),labels=label)


dev.off()


