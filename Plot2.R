setwd("~/Documents/ce/ExData_Plotting1")

data <- read.table("./data/household_power_consumption.txt", 
                   header = TRUE, sep = ";", 
                   na = "?", 
                   colClasses = c(rep("character", 2), rep("numeric", 7)))
attach(data)
df <- data[(data$Date == "1/2/2007" | data$Date == "2/2/2007"), ]
attach(df)
df$DateTime <- strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S")
rownames(df) <- 1 : nrow(data)
attach(df)
df <- cbind(df[, 10], df[, 3:9])
colname <- colnames(df)
colname[1] <- "Date_time"
colnames(df) <- colname
attach(df)

png(filename = "Plot2.png", width = 480, height = 480, units = "px")
plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")
axis(1, at = c(1, 1441, 2880), labels = c("Thu", "Fri", "Sat"))
lines(Date_time, Global_active_power, col = "black")
dev.off()
rm(data)