library(data.table)
library(lubridate)
#EPC is Electric power Consumption,na.strings ="?" replaces all "?" with NAs

EPC_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")

#Sub_data is the required data from 1/2/2007 to 2/2/2007
sub_data<-subset(EPC_data,Date %in% c("1/2/2007","2/2/2007"))

#combine Date and Time and store it in a variable Date_Time in the dataset sub_data
sub_data$Date_Time<-paste(sub_data$Date, sub_data$Time)

#using strptime() to convert Date , Time to date and time format
sub_data$Date_Time<-strptime(sub_data$Date_Time,format="%d/%m/%Y %H:%M:%S")

#creating plot2.png file using png ()
png("plot2.png",width=480,height = 480)
plot(x=sub_data$Date_Time,y=sub_data$Global_active_power,xlab="",ylab = "Global Active Power(kilowatts)",type="l")
dev.off()