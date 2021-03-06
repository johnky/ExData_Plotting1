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
png(file="plot4.png",width=800,height=800,res=72)

## Going to set up for a 2 x 2 arrangement of the Graphs
## 2 on top row
## 2 on the bottom row
par(mfrow=(c(2,2)))

##
## place the first Graph for Time vs Global Active Power
## this will go in the upper left Corner
plot(PlotData$DateTime,PlotData$Global_active_power,type = "l", xlab="", ylab="Global Active Power")

##
## place the 2nd Graph for Time vs Voltage
## this will go in the upper Right Corner
plot(PlotData$DateTime,PlotData$Voltage,type = "l", xlab="", ylab="Voltage")


##
## place the 3nd Graph for Time vs Voltage
## this will go in the lower Left Corner

## plot a Time verus S Metering using 3 line graphs
## first set up the plot with the "Sub_metering_1" 
## declare the Labels for X & Y
## set the color for this line to black
plot(PlotData$DateTime,PlotData$Sub_metering_1,type = "l", xlab="", ylab="Energy sub metering",col="black")

## add the 2nd line, "Sub_metering_2" and set the color to Red
lines(PlotData$DateTime,PlotData$Sub_metering_2,type = "l",col="red")

## add the 3rd line, "Sub_metering_3" and set the color to Blue
lines(PlotData$DateTime,PlotData$Sub_metering_3,type = "l",col="blue")


##Set the legend for the upper right corner
legend("topright", lty=1,col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))



##
## place the 3nd Graph for Time vs Global Reactive Power
## this will go in the lower Right Corner
plot(PlotData$DateTime,PlotData$Global_reactive_power,type = "l", xlab="", ylab="Global_Reactive_Power")

## Complete the PNG File
dev.off()
