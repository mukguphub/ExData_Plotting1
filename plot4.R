#Read Data Function
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors=FALSE)
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- data[data$Date %in% as.Date(c('2007-02-01',' 2007-02-02')),]
data$Time <- paste(data$Date,data$Time,sep=" ")
data$Time <- as.POSIXct(data$Time,"%Y-%m-%d %H:%M:%S", tz="GMT") 

png("plot4.png",width = 480,height = 480,units = "px",bg="transparent")
par(mfrow=c(2,2))

plot(data$Time,data[,3], type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Time,data[,5], type="l", ylab="Voltage", xlab="datetime")

plot(data$Time,data[,7], type="l", ylab="Energy sub metering", xlab="")
points(data$Time,data[,8],type="l",col="red")
points(data$Time,data[,9],type="l",col="blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),pch='___',border="transparent")

plot(data$Time,data[,4], type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()