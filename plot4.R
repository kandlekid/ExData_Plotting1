# cas ... proj 1, plot 4.

##################################################################
# Please ensure R script readFile.R is run before executing this #
# script, in order to create the input file.                     #
##################################################################

setwd("~/SOURCE/ExploratoryDataAnalysis");

# Read the input file.

mydata <- read.table("household_power_consumption-2-1And2-2007.txt", sep=";", head=TRUE);

#dates=c("2007/02/01","2007/02/02","2007/02/03");

# Get the sub metering fields into the data frame.

dfData <- subset(mydata,select=c(Global_active_power,Voltage,Sub_metering_1,Sub_metering_2,Sub_metering_3,Global_reactive_power,Date,Time));

# Add DateTime field to data frame.

dfData[,"DateTime"] <- as.POSIXct(paste(dfData$Date,dfData$Time),format="%d/%m/%Y %H:%M:%S",tz="");
#dfData[,"DateTime"] <- as.POSIXct(paste(dfData$Date,dfData$Time),format="%d/%m/%Y %H:%M:%S",tz="");

par(mfrow=c(2,2))

#plot(dfData$DateTime,dfData$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="");
#lines(dfData$DateTime,dfData$Sub_metering_2,type="l",col="red");
#lines(dfData$DateTime,dfData$Sub_metering_3,type="l",col="blue");
#legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"));

# plot 1.

plot(dfData$DateTime,dfData$Global_active_power,yaxt='n',ylab="Global Active Power (kilowatts)",xlab="",type="l");
axis(side=2,at=seq(0,6,by=2),labels=seq(0,6,by=2));

# plot 2.

plot(dfData$DateTime,dfData$Voltage,yaxt='n',ylab="Global Active Power (kilowatts)",xlab="",type="l");
axis(side=2,at=seq(0,6,by=2),labels=seq(0,6,by=2));

# plot 3.

plot(dfData$DateTime,dfData$Sub_metering_1,type="l",ylab="Energy Sub Metering",xlab="");
#plot(dfData$DateTime,dfData$Sub_metering_2,type="l",col="red");
#plot(dfData$DateTime,dfData$Sub_metering_3,type="l",col="blue");
lines(dfData$DateTime,dfData$Sub_metering_2,type="l",col="red");
lines(dfData$DateTime,dfData$Sub_metering_3,type="l",col="blue");
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5),col=c("black","red","blue"));

# plot 4.

plot(dfData$DateTime,dfData$Global_reactive_power,yaxt='n',ylab="Global Active Power (kilowatts)",xlab="",type="l");
axis(side=2,at=seq(0,6,by=2),labels=seq(0,6,by=2));


# Copy the plot to the png file.

dev.copy( png, file="plot4.png", height=480, width=480);
dev.off();
