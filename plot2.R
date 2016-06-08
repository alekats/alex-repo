f<-1:2880
png(filename = "plot2.png", width = 480, height = 480, units = "px")
par(mfrow=c(1,1))
plot(f,as.numeric(as.character(data_set$Global_active_power)), type="n", xaxt="n",ylab="Global Active Power (kilowatts)",xlab="")
lines(f,as.numeric(as.character(data_set$Global_active_power)))
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
dev.off()