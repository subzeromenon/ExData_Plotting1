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

plot(da1$datetime, da1$Global_active_power,type= "l", ylab=" Global Active Power (Kilowatts)",xlab="")
dev.copy(png,file="Plot2.png",width = 480, height= 480)
dev.off()