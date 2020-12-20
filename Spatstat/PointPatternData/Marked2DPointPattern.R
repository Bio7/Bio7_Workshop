#RScript - please enter your code here !
library(maptools)
library(spatstat)
spatialPointsDF<-as(spatialPointsDataFrame, "ppp")
plot(spatialPointsDF)