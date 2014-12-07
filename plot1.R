data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?",stringsAsFactors=FALSE)
for (i in 3:8){
  data[,i]<-as.numeric(data[,i])
}
data[,2]<-paste(data[,1],data[,2])

x<-strptime(data[,2], "%d/%m/%Y %H:%M:%S")
data<-data[,3:9]
df<-subset(data,x>="2007-02-01" & x<"2007-02-03")
xTime<-subset(x,x>="2007-02-01" & x<"2007-02-03")
hist(df$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!