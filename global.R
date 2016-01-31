dfknmi <- read.csv ("knmi2.csv", header= TRUE)
#
# In order to plan your picknick we now proudly present the 
# weather predictor
# 
# Thanks to our friends from the KNMI (The royal dutch meteorological instute)
# who kindly share their data I have been able to build a cool prediction alogithm
#
# Based on the date (year, month and day) we will predict the important weather 
# variables
#
# Let's not make it too complicated:
#
# I will use the following parameters as predictors:
# 1. The year: because of global (and local) warming, this may be 
#    a significant factor (use as numeric variable)
# 2. Month: obviously (as factor)
# 3. Day of the month
# The following will be predicted
# 1. Average temperature for the day (TG, in 0.1 degrees Celsius, numeric)
# 2. Average wind speed for the day (FG, in 0.1 m/s)
# 3. Duration of precitipation (DR, in 0.1 hours)
# 4. Total amount of precipitation (RH, in 0.1 mm)
# 5. Amount of sunshine (SQ, in 0.1 hours)
#
dfsubknmi <- data.frame(
              cbind(substr(dfknmi$YYYYMMDD, 1, 4)
                  , substr(dfknmi$YYYYMMDD, 5, 6)
                  , substr(dfknmi$YYYYMMDD, 7, 8)
                  , dfknmi$TG
                  , dfknmi$FG
                  , dfknmi$DR
                  , dfknmi$RH
		  , dfknmi$SQ
))

colnames(dfsubknmi) <- c("Year", "Month", "Day", "Temp", "Wind", "PrecTime", "PrecAmt", "Sunshine")
dfsubknmi$Month <- as.factor(as.character(dfsubknmi$Month))
dfsubknmi$Year <- as.numeric(as.character(dfsubknmi$Year))
dfsubknmi$Day <- as.numeric(as.character(dfsubknmi$Day))
dfsubknmi$Temp <- as.numeric(as.character(dfsubknmi$Temp))
dfsubknmi$Wind <- as.numeric(as.character(dfsubknmi$Wind))
dfsubknmi$PrecTime <- as.numeric(as.character(dfsubknmi$PrecTime))
dfsubknmi$PrecAmt <- as.numeric(as.character(dfsubknmi$PrecAmt))
dfsubknmi$Sunshine <- as.numeric(as.character(dfsubknmi$Sunshine))
 
dfsubknmi2 <- na.omit(dfsubknmi)

library(caret)

glmtemp <- train(Temp ~ Year
              +Month
	      +Day, data= dfsubknmi, method = "glm")
glmwind <- train(Wind ~ Year
              +Month
	      +Day, data= dfsubknmi, method = "glm")
glmprectime <- train(PrecTime ~ Year
              +Month
	      +Day, data= dfsubknmi, method = "glm")
glmprecamt <- train(PrecAmt ~ Year
              +Month
	      +Day, data= dfsubknmi, method = "glm")
glmsunshine <- train(Sunshine ~ Year
              +Month
	      +Day, data= dfsubknmi, method = "glm")



df1 <- data.frame(Year=double(),
                 Month=factor(),
		 Day = double()
)

df1$Month <- factor(df1$Month,levels=c("01","02", "03", "04", "05", "06", "07", "08", "09", "10"
                   ,"11", "12"))

