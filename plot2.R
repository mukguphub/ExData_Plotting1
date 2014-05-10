#Read Data Function
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors=FALSE)
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- data[data$Date %in% as.Date(c('2007-02-01',' 2007-02-02')),]
data$Time <- paste(data$Date,data$Time,sep=" ")
data$Time <- as.POSIXct(data$Time,"%Y-%m-%d %H:%M:%S", tz="GMT") 

#Plot on png file
png("plot2.png",width = 480,height = 480,units = "px",bg="transparent")

plot(data$Time,data[,3], type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()



