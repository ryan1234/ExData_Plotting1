library(plyr)

df <- read.table("household.txt", header=TRUE, sep=";", na.strings = 'NULL', 
                 colClasses=c("character","character","character","character","character","character",
                              "character","character","character"))

png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

# graph 1
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     plot(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
          y=as.numeric(Global_active_power), 
          type="l",
          xlab="",
          ylab="Global Active Power"),
     lines(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
           y=as.numeric(Global_active_power), 
           type="l")
)

#graph 2
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     plot(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
          y=as.numeric(Voltage), 
          type="l",
          xlab="datetime",
          ylab="Voltage"),
     lines(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
           y=as.numeric(Voltage), 
           type="l")
)

#graph 3
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
legend("topright", col=c("black", "red", "blue"), bty = "n", lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#graph 4
with(subset(df, as.Date(Date, format="%d/%m/%Y") == "2007-02-01" | as.Date(Date, format="%d/%m/%Y") == "2007-02-02"), 
     plot(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
          y=as.numeric(Global_reactive_power), 
          type="l",
          xlab="datetime",
          ylab="Global_reactive_power"),
     lines(x=strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"), 
           y=as.numeric(Global_reactive_power), 
           type="l")
)
dev.off()