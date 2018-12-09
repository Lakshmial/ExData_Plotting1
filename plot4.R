library(data.table)
library(lubridate)
#EPC is Electric power Consumption,na.strings ="?" replaces all "?" with NAs
EPC_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")

#Sub_data is the required data from 1/2/2007 to 2/2/2007
sub_data<-subset(EPC_data,Date %in% c("1/2/2007","2/2/2007"))

#combine Date and Time and store it in a variable datetime in the dataset sub_data
sub_data$datetime<-paste(sub_data$Date, sub_data$Time)

#using strptime() to convert Date , Time to date and time format

sub_data$datetime<-strptime(sub_data$datetime,format="%d/%m/%Y %H:%M:%S")

png("plot4.png",width = 480,height = 480)

#using par()to combine multiple plots in one graph
par(mfrow=c(2,2))

#plot of datetime vs Global_active_power
plot(x=sub_data$datetime,y=sub_data$Global_active_power,xlab="",ylab = "Global Active Power(kilowatts)",type="l")

#plot of datetime vs Voltage
plot(x=sub_data$datetime,y=sub_data$Voltage,xlab = "datetime",ylab = "Voltage",type="l")

#plot of datetime vs sub_metering_1,sub_metering_2,sub_metering_3 in a single plot
plot(x=sub_data$datetime,y=sub_data$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l",col="black")
lines(x=sub_data$datetime,y=sub_data$Sub_metering_2,type = "l",col="red")
lines(x=sub_data$datetime,y=sub_data$Sub_metering_3,type = "l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"),lty = c(1,1,1))

#plot of datetime vs Global_reactive_power
plot(x=sub_data$datetime,y=sub_data$Global_reactive_power,xlab = "datetime",ylab="Global_reactive_power",type = "l")

dev.off()