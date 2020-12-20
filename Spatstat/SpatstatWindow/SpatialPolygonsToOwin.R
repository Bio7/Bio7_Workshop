#Convert SpatialPolygons to a spatstat window (owin) object.
library(maptools)
library(spatstat)
polWin<-as(spatialPolygons, "owin")