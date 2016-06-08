temp<-read.table("household_power_consumption.txt",header=TRUE, sep=";")
temp1<-temp[temp$Date=="1/2/2007",]
temp2<-temp[temp$Date=="2/2/2007",]
data_set<-merge.data.frame(temp1,temp2,all=TRUE)
png(filename = "plot1.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
hist(as.numeric(as.character(data_set$Global_active_power)),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()