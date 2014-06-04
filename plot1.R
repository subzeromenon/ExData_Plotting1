#Works if put in the same working dir. only. 

#ndata<-read.csv("household_power_consumption.txt", header=T,sep= ";",colClasses=c("Date","POSIXct","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
da<-read.table("household_power_consumption.txt",header=T,sep=";")

da$Date <- as.Date((da$Date), "%d/%m/%Y") 
#newdate <- as.character(da$Date)
############Check the formats for future ref. 
############Only looking at data from 2007-02-01 and 2007-02-02
#Removing the extra memory being used. 
da1 <- subset(da,da$Date >= "2007-02-01" & da$Date <= "2007-02-02" )
rm(da)
#strftime() with format "%H:%m"%s would strip the time from POSIXct class
#POSIXct would convert character to format %Y-%m-%d %H:%m:%s
#strptime() with format %Y-%m-%d would strip out the date from POSIXct class

#http://stackoverflow.com/questions/10699511/difference-between-as-posixct-as-posixlt-and-strptime-for-converting-character-v

#Look at this to to understand the difference between POSIXct and POSIXlt


hist(as.numeric(as.character(da1$Global_active_power)),col = "red", main="Global Active Power", xlab = "Global Active Power(Kilowatts)", ylab = "Frequency",ylim=c(0,1200))
dev.copy(png,file="Plot1.png",width = 480, height= 480)
dev.off()
