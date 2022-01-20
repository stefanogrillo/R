# Remove previous codes from the console; upload package
rm(list=ls())
library (fpp2)

# Plot Australian Beer
autoplot (ausbeer)

# Summary: function to check for important data: mean, median, quartiles, min/Max
summary (ausbeer)
# Median is above mean: data is slightly upper-skewed


# Create Subsets

# Subset 1: from 1st quarter of 1960 to 1st quarter of 1991 (data is in quarters)
beer1 <- window(ausbeer, c(1960,1), c(1991,1))

# Subset 2: the last 5 years
beer2 <- subset(ausbeer, start=length(ausbeer) -4*5+1)

# Subset 3: select only 1st and 3rd quartiles
beer3 <- subset(ausbeer, quarter=c(1,3))

# Subset 4: select only the last 45 observations
beer4 <- tail(ausbeer, 45)

# Observe first 6 (head) and last 6 (tail) observations
head(beer2) 
tail(beer2)
