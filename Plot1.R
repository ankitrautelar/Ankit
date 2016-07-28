data<-read.csv("P:/R/household_power_consumption.txt",header=TRUE,sep = ';')

data1<-subset(data,Date=="1/2/2007")

data2<-subset(data,Date=="2/2/2007")

datanew<-rbind(data1,data2)

names(datanew)<-gsub("_","",names(datanew))

png("Plot1.png", width = 480, height = 480, units = "px", bg = "white")

hist(as.numeric(datanew$Globalactivepower)/500,col="red",main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()


