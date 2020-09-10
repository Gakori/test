### OUTLIERS

cars1 <- cars[1:30, ] # original data
cars1
cars_outliers <- data.frame(speed=c(19,19,2,20,20),
                            dist=c(190,186,210,220,218))#introduce outliers
cars2 <- rbind(cars1, cars_outliers) # data with outliers
cars2

# plot of data with outliers

par(mfrow=c(1,2))
plot(cars2$speed, cars2$dist, xlim=c(0, 28), ylim=c(0, 230), 
     main="With Outliers", xlab="speed", ylab="dist", pch="*", 
     col="red", cex=2)
abline(lm(dist ~ speed, data=cars2), col="blue", lwd=3, lty=2)

# Plot of original data without outliers. Note the change in slope (angle) of best fit line.
plot(cars1$speed, cars1$dist, xlim=c(0, 28), ylim=c(0, 230),
     main="Outliers removed \n A much better fit!", xlab="speed", 
     ylab="dist", pch="*", col="red", cex=2)
abline(lm(dist ~ speed, data=cars1), col="blue", lwd=3, lty=2)


# detect outliers // univariate

url <- "https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv"  
inputData <- read.csv(url) # import data
head(inputData)

outlier_values <- boxplot.stats(inputData$pressure_height)$out #outlier values
outlier_values
boxplot(inputData$pressure_height, main="Pressure Height", boxwex=0.1)
mtext(paste("Outliers: ", paste(outlier_values, collapse=", ")), cex=0.6)


## bivariate approach
url <- "https://raw.githubusercontent.com/selva86/datasets/master/ozone.csv"
ozone <- read.csv(url)
# For categorical variable
boxplot(ozone_reading ~ Month, data=ozone, main="Ozone reading across months")  # clear pattern is noticeable.
boxplot(ozone_reading ~ Day_of_week, data=ozone, main="Ozone reading for days of week")  # this may not be significant, as day of week variable is a subset of the month var.

# For continuous variable (convert to categorical if needed.)
boxplot(ozone_reading ~ pressure_height, data=ozone, main="Boxplot for Pressure height (continuos var) vs Ozone")
boxplot(ozone_reading ~ cut(pressure_height, pretty(inputData$pressure_height)), data=ozone, main="Boxplot for Pressure height (categorial) vs Ozone", cex.axis=0.5)


A <- c(3,2,5,6,4,8,1,2,30,2,4)
A
#bixplot for A
boxplot(A)
boxplot.stats(A)$out
non_greater_than_20 <- A > 20 
non_greater_than_20


# challange

install.packages('tidyverse')
library(tidyverse)
library(data.table)
bus <- fread('http://bit.ly/BusNairobiWesternTransport')

#preview dataset

View(bus)
str(bus)
dim(bus)
class(bus)

boxplot(bus$ride_id)$out
boxplot.stats(bus$ride_id)$out

detect using bi,uni,multi
impute mean, medium,mode
or capping replace with 5thpercentile(lower) / 95percentile (upper)