# cas ... Proj1, Plot1 source.

##################################################################
# Please ensure R script readFile.R is run before executing this #
# script, in order to create the input file.                     #
##################################################################

setwd("~/SOURCE/ExploratoryDataAnalysis");

# Read the input file.

mydata <- read.table("household_power_consumption-2-1And2-2007.txt", sep=";", head=TRUE);

# Create 8 bins, each bin .5 kilowatt wide.

bins=seq(0,8,by=0.5);

# Create the histogram.

hist(mydata$Global_active_power,xaxt='n',breaks=bins,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)");
axis(side=1,at=seq(0,6,2),labels=seq(0,6,2));

# Copy the histogram to a png file.

dev.copy( png, file="plot1.png", height=480, width=480);
dev.off();
