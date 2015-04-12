#setwd("~/SOURCE/ExploratoryDataAnalysis");

# Read the input file.

mydata <- read.table("household_power_consumption-2-1And2-2007.txt", sep=";", head=TRUE);

# Get the Global_active_power, Date, Time cols of each record.

dfData <- subset(mydata,select=c(Global_active_power,Date,Time));

# Create a new column DateTime in the format %d/%m/%Y %H:%M:%S.

dfData[,"DateTime"] <- as.POSIXct(paste(dfData$Date,dfData$Time),format="%d/%m/%Y %H:%M:%S",tz="");

# Plot the data.

plot(dfData$DateTime,dfData$Global_active_power,yaxt='n',ylab="Global Active Power (kilowatts)",xlab="",type="l");
axis(side=2,at=seq(0,6,by=2),labels=seq(0,6,by=2));

# Copy the plot to the png file.

dev.copy( png, file="plot2.png", height=480, width=480);
dev.off();
