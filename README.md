# Shiny-weahter-prediction
Prediction of certain weather variables based on a specified date

To use this application copy the files to a directory on your computer.
Then set your working directory in r to this directory
Load the shiny library with : library(shiny)
run the application with runApp(). This will take some time because the 
predictors will be calculated (they are in global.R). 

The app asks for a date (Year, month, day) and will predict certain
weather variables on that day.
The data used is the data from the Knmi (Royal Ducht Meteorological Instute)
in the Netherlands. The data is only useful in the Netherlands.

The data is not useful if the dates are widely outside the range of 
measurements (between 1900 and 2015), so results are not meaningful if
a date in 1700 or 2200 is inserted.
