## Start of Common code for all 4 parts of this project
## Much easier to do the same thing and copy this code to each R file then recreate.

## Read all data from the text file with a separator being a Semi-Colon.
## the file does have headers
## My PC has plenty of RAM so no issue with this
PlotData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)


## set the Start Date and End Date
StartDate <- "2007-02-01"
EndDate <-  "2007-02-02"


## filter the date range needed
## use a subset function and the as.Date function 
PlotData <- subset(PlotData, as.Date(PlotData$Date,"%d/%m/%Y") >= StartDate & as.Date(PlotData$Date,"%d/%m/%Y") <= EndDate)

## Create a new column called DateTime which will be the combination of the Date and Time column
PlotData$DateTime <- strptime(paste(PlotData$Date, PlotData$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
 

## convert the "Factor" columns to "Numeric"
## not all of these were needed but consistency  is a good thing
PlotData$Global_active_power <-as.numeric(as.character(PlotData$Global_active_power))
PlotData$Global_reactive_power <-as.numeric(as.character(PlotData$Global_reactive_power))
PlotData$Voltage <-as.numeric(as.character(PlotData$Voltage))
PlotData$Global_intensity <-as.numeric(as.character(PlotData$Global_intensity))
PlotData$Sub_metering_1 <-as.numeric(as.character(PlotData$Sub_metering_1))
PlotData$Sub_metering_2 <-as.numeric(as.character(PlotData$Sub_metering_2))
PlotData$Sub_metering_3 <-as.numeric(as.character(PlotData$Sub_metering_3))



## end of Common Code
## Time to do some plotting



##open the PNG file to contain the chart
png(file="plot1.png",width=800,height=800,res=72)


## Plot the Histogram
## Global_active_power is what is being plotted using the default Frequency chart
## Add a Main Title of "Global Active Power"
## Change the X Lab to "Global Active Power (kilowatts)"
## set the color to red
hist(PlotData$Global_active_power,main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

## Complete the PNG File
dev.off()

