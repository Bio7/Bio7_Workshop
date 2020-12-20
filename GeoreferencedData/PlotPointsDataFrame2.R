#RScript - please enter your code here !
library(maptools)
library(sp)
#Load a Geotiff and plot it with:
image(yourTiffData, axes=TRUE,useRaster=TRUE)
#Here we can add our measurements (from a ImageMethods Selection transfer!)
plot(spatialPointsDataFrame,  add=TRUE)



