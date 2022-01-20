# Exercises from Chapter 2.10

rm(list=ls())


# 1

# Use the help function to explore gold, woolyrnq and gas
# Use autoplot()
# What is their frequency?
# Use which.max() to spot the outlier in the gold series

library(fpp2)

?gold
# Daily morning gold prices in US dollars. 1 January 1985 – 31 March 1989
?woolyrnq
# Quarterly production of woolen yarn in Australia: tonnes. Mar 1965 – Sep 1994
?gas
# Australian monthly gas production: 1956–1995

autoplot(gold)
# Non-stationary Time Series
tsdisplay(gold)
# Time Series, ACF and PACF 
autoplot(woolyrnq)
# Cyclical Time Series
autoplot(gas)
# Seasonal Time Series (regular annual season)

which.max(gold)
# Maximum value at $770 USD


# 2

# Read the data from "tute1.csv"
# Convert the data to time series
# Construct time series plots of each of the three series

rm(list=ls())

# Set Working Directory; import data
tute1 <- read.csv("tute1.csv", header=TRUE)

# Plot data
mytimeseries <- ts(tute1[,-1], start=1981, frequency=4)
autoplot(mytimeseries) # Same as "autoplot(mytimeseries, facets=FALSE)"
autoplot(mytimeseries, facets=TRUE)
# The graphs are slightly different, with "facets=FALSE" being more readable

