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
plot(xTime,df$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(xTime,df$Sub_metering_2,col="red")
lines(xTime,df$Sub_metering_3,col="blue")
legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex=0.5, pt.cex = 1)
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!

## restore system's original locale
Sys.setlocale("LC_TIME", locale)











