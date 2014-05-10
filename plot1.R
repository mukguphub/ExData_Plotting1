#Read Data Function
data<- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",stringsAsFactors=FALSE)
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")
data <- data[data$Date %in% as.Date(c('2007-02-01',' 2007-02-02')),]

png("plot1.png",width = 480,height = 480,units = "px",bg="transparent")

hist(data[,3], main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()
