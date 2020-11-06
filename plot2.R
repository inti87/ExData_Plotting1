# Draw plot 2

source("get_data.R")

# Create plot & save it to .png 
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(x = df$datetime, 
     y = df$global_active_power, 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
