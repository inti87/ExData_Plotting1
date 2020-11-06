# Draw plot 3

source("get_data.R")

# Create plot & save it to .png 
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(x = df$datetime, 
     y = df$Sub_metering_1, 
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(x = df$datetime, 
      y = df$Sub_metering_2,
      col = "red")
lines(x = df$datetime, 
      y = df$Sub_metering_3,
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1))
dev.off()