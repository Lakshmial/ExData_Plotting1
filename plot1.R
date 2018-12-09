library(data.table)
library(lubridate)
#EPC is Electric power Consumption,na.strings ="?" replaces all "?" with NAs

EPC_data<-read.table("household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?")

#Sub_data is the required data from 1/2/2007 to 2/2/2007
sub_data<-subset(EPC_data,Date %in% c("1/2/2007","2/2/2007"))

#converting sub_data$Date to Date format 
sub_data$Date<-as.Date(sub_data$Date,"%d/%m/%Y")
#creating plot1.png file using png()
png("plot1.png",width = 480,height = 480)
hist(sub_data$Global_active_power,main = "Global Active Power",col="red",xlab= "Global Active power(kilowatts)")
dev.off()
