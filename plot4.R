f<-1:2880
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
par(mar=c(4.5,3.8,4.5,3))
plot(f,as.numeric(as.character(data_set$Global_active_power)), type="n", xaxt="n",ylab="Global Active Power",xlab="")
lines(f,as.numeric(as.character(data_set$Global_active_power)))
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))

plot(f,as.numeric(as.character(data_set$Voltage)), type="n", xaxt="n",ylab="Voltage",xlab="datetime")
lines(f,as.numeric(as.character(data_set$Voltage)))
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))

plot(f,as.numeric(as.character(data_set$Sub_metering_1)), type="n", xaxt="n",ylab="Energy sub metering",xlab="")
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
lines(f,as.numeric(as.character(data_set$Sub_metering_1)))
lines(f,as.numeric(as.character(data_set$Sub_metering_2)),col="red")
lines(f,as.numeric(as.character(data_set$Sub_metering_3)),col="blue")
legend("topright", lty=c(1,1), col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(f,as.numeric(as.character(data_set$Global_reactive_power)), type="n", xaxt="n",ylab="Global_reactive_power",xlab="datetime")
lines(f,as.numeric(as.character(data_set$Global_reactive_power)))
axis(1,at=c(1,1441,2881),labels=c("Thu","Fri","Sat"))
dev.off()