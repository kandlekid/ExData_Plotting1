# cas ... Proj1, ReadFile source.

setwd("~/SOURCE/ExploratoryDataAnalysis");

# Create files containing the dates needed (1/2/2007 and 2/2/2007).

system("egrep ^1/2/2007 household_power_consumption.txt > household_power_consumption-2-1-2007.txt",intern=TRUE);
system("egrep ^2/2/2007 household_power_consumption.txt > household_power_consumption-2-2-2007.txt",intern=TRUE);

# Write the header to the input file.

system("egrep Date household_power_consumption.txt > household_power_consumption-2-1And2-2007.txt",intern=TRUE);

# Paste the date files to the input file.

system("cat household_power_consumption-2-1-2007.txt >> household_power_consumption-2-1And2-2007.txt",intern=TRUE);
system("cat household_power_consumption-2-2-2007.txt >> household_power_consumption-2-1And2-2007.txt",intern=TRUE);