library(plyr)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="data.zip", method="curl")
unzip("data.zip")
df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = 'NULL', 
                 colClasses=c("character","character","character","character","character","character",
                              "character","character","character"))

png(filename="plot3.png", width=480, height=480)
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     plot(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
          y=as.numeric(Sub_metering_1),
          xlab="",
          ylab="Energy sub metering",
          type="l",
          col="black")
)
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     lines(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
           y=as.numeric(Sub_metering_2),
           col="red")
)
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     lines(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
           y=as.numeric(Sub_metering_3),
           col="blue")
)
legend("topright", col=c("black", "red", "blue"), lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
