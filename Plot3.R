#Works if put in the same working dir. only. 

da<-read.table("household_power_consumption.txt",header=T,sep=";")
da$Date <- as.Date(as.character(da$Date), "%d/%m/%Y") 

############Only looking at data from 2007-02-01 and 2007-02-02

da1 <- subset(da,da$Date >= "2007-02-01" & da$Date <= "2007-02-02" )
rm(da)
da1$Time<- as.character(da1$Time)
da1$Global_active_power <- as.numeric(as.character(da1$Global_active_power))
datetime <- strptime(paste(da1$Date,da1$Time,sep=""), format = "%Y-%m-%d %H:%M:%S")
da1<-cbind(da1,datetime)

#For further reference always convert date and time to chara before using them.
#> class(datetime)
#[1] "POSIXlt" "POSIXt" 

plot(da1$datetime,as.numeric(as.character(da1$Sub_metering_1)),type="l",xlab= "",ylab="Energy sub metering")
lines(da1$datetime,as.numeric(as.character(da1$Sub_metering_2)),col="red")
lines(da1$datetime,da1$Sub_metering_3,col="blue")
legend("topright", lty = c(1,1,1), lwd=2.5,col=c("black","red","blue"),cex=0.65,c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="Plot3.png",width = 480, height= 480)
dev.off()