#Convert SpatialLines to a spatstat lines (psp) object.
library(maptools)
library(spatstat)

#Next recipes from: 
#Handling shapefiles in the spatstat package
#Adrian Baddeley, Rolf Turner and Ege Rubak
#2015-06-28
#spatstat version 1.42-2

#1. collect together all the line segments (all the segments that make up all the connected curves)
#and store them as a single object of class psp.
linesPSP<-as(spatialLines, "psp")

#or:

#2. convert each connected curve to an object of class psp, keeping different connected curves sepa-
#rate.
out <- lapply(spatialLines@lines, function(z) { lapply(z@Lines, as.psp) })

curvegroup <- lapply(out, function(z) { do.call("superimposePSP", z)})


