data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
for (i in 3:8){
  data[,i]<-as.numeric(data[,i])
}
data[,2]<-paste(data[,1],data[,2])
## save current system's locale
locale <- Sys.getlocale(category = "LC_TIME")

## set English locale in order to have labels printed in English
Sys.setlocale("LC_TIME", "English")




x<-strptime(data[,2], "%d/%m/%Y %H:%M:%S")
data<-data[,3:9]
df<-subset(data,x>="2007-02-01" & x<"2007-02-03")
xTime<-subset(x,x>="2007-02-01" & x<"2007-02-03")
par(mfrow = c(2, 2))
plot(xTime,df[,1],type="l",xlab="",ylab="Global Active Power")
plot(xTime,df$Voltage,type="l",xlab="datatime",ylab="Voltage")
plot(xTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(xTime,df$Sub_metering_2,col="red")
lines(xTime,df$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5,  pt.cex = 1)
plot(xTime,df$Global_reactive_power,type="l",xlab="datatime",ylab="Global_reactive_power")
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

## restore system's original locale
Sys.setlocale("LC_TIME", locale)