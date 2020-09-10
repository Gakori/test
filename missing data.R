## HANDLING MISING DATA

x <- c(1,2,NA,30)
x
x <- c(1,2,NA,3)
mean(x)

Name <- c('John', 'tim', NA)
Sex <- c('men', 'men', 'women')
Age <- c(45,53,NA)
dt <- data.frame(Name, Sex, Age)
dt

is.na(dt)
dt$Age[dt$Age == 99] <- NA
dt

Name <- c("John", "Tim", NA)
Sex <- c("men", NA, "women")
Age <- c(45, 53, NA)
dt <- data.frame(Name, Sex, Age)
dt

na.omit(dt)

install.packages('mice')
library(mice)

## challenge 3

air <- fread('http://bit.ly/AirQualityDataset')
air


## data summary

summary(air)

# check for missing values
pMiss <- function(x){sum(is.na(x))/length(x)*100}
apply(air,2,pMiss)
apply(air, 1, pMiss)

library(mice)
md.pattern(air)

library(VIM)
install.packages('VIM')
aggr_plot <- aggr(air, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE, labels=names(air), cex.axis=.7, gap=3, ylab=c("Histogram of missing data","Pattern"))

par('mar')
par(mar=c(1,1,1,1))

aggr_plot <- aggr(air, col=c('navyblue','red'), numbers=TRUE, sortVars=TRUE,
                  labels=names(air), cex.axis=.7, gap=3,
                  ylab=c("Histogram of missing data","Pattern"))
dev.off()

marginplot(air[c(1,2)])


## imputing missing data

data <- mice(air,m=5,maxit = 50, meth='pmm',seed = 500)

summary(data)

data$imp$Ozone


completedData <- complete(data,1)
completedData
is.na(completedData)
sum(is.na(completedData))


