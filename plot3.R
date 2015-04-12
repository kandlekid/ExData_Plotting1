setwd("~/SOURCE/ExploratoryDataAnalysis");
mydata <- read.table("household_power_consumption-2-1And2-2007.txt", sep=";", head=TRUE);
#myDate <- mydata$Date;

dates=c("2007/02/01","2007/02/02","2007/02/03");
#dfDate <- data.frame(date=c("2007/02/01","2007/02/02","2007/02/03"));

#dfData <- subset(mydata,select=c(Global_active_power,Date,Time));
dfData <- subset(mydata,select=c(Sub_metering_1,Sub_metering_2,Sub_metering_3,Date,Time));

dfData[,"DateTime"] <- as.POSIXct(paste(dfData$Date,dfData$Time),format="%d/%m/%Y %H:%M:%S",tz="");
#plot(dfData$DateTime,dfData$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",ylim=c(0,6),type="l")

plot(dfData$DateTime,dfData$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="");
#plot(dfData$DateTime,dfData$Sub_metering_2,type="l",col="red");
#plot(dfData$DateTime,dfData$Sub_metering_3,type="l",col="blue");
lines(dfData$DateTime,dfData$Sub_metering_2,type="l",col="red");
lines(dfData$DateTime,dfData$Sub_metering_3,type="l",col="blue");
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"));

# Copy the plot to the png file.
dev.copy( png, file="plot3.png", height=480, width=480);
dev.off();
