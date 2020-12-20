# A polygonal window with a point pattern object can also be created with 
# the ‘Image-Methods’ view action ‘Selection’ which opens a view to transfer
# different type of ImageJ selections as spatial data.
#
# 1.    Open the ‘Image-Methods’ view and execute the action ‘Selection’
# 2.    Open e.g., the blobs.gif example and make a polygonal selection
# 3.    Add the selection to the ROI Manager
# 4.    Transfer the selection with an enabled ‘Spatial Data’ option as a ‘Spatial Polygons’ - this will create the variable ‘spatialPolygon’ in the R workspace
# 5.    Convert the SpatialPolygon to a spatstat window object (see code below)
# 6.    Threshold the image and execute the ‘Particle’ action in the Image-Methods view
# 7.    Make a Particle analysis with Bio7 and ImageJ
# 8.    Plot the particles with the polygonal window

library(maptools)
library(spatstat)
polWin<-as(spatialPolygons, "owin")
#plot(polWin)
#Create point pattern object from the specified window and points
X<- ppp(Particles$X, Particles$Y,window=polWin)
plot(X)