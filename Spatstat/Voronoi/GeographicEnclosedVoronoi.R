#From: 
#http://stackoverflow.com/questions/24236698/voronoi-diagram-polygons-enclosed-in-geographic-borders
#Author: Ege Rubak
library(maps)
library(maptools)
library(spatstat)
library(rgeos)

counties <- map('county', c('maryland,carroll', 'maryland,frederick', 
                            'maryland,montgomery', 'maryland,howard'), 
                fill=TRUE, plot=FALSE)
# fill=TRUE is necessary for converting this map object to SpatialPolygons
countries <- gUnaryUnion(map2SpatialPolygons(counties, IDs=counties$names,
                                 proj4string=CRS("+proj=longlat +datum=WGS84")))
W <- as(countries, "owin")



X <- ppp(x=c(-77.208703, -77.456582, -77.090600,  -77.035668, -77.197144),
         y=c(39.188603, 39.347019, 39.672818, 39.501898, 39.389203), window = W)

y <- dirichlet(X) # Dirichlet tesselation
plot(y) # Plot tesselation
plot(X, add = TRUE) # Add points
tile.areas(y) #Areas