#RScript - please enter your code here !
#
#An example how to load, edit and save a GeoTIFF with rgdal and ImageJ!
library(rgdal)
library(raster)
#1. Load an geotiff image.
data = readGDAL("I:/yourGeo.tif")
#2. Read out the projection.
proj4<-proj4string(data)

#3. Again load an image in ImageJ
#4. Manipulate the image.
#5. Transfer the image to R as a matrix (imageMatrix)
#6.Convert the imageMatrix to a raster object with the extracted projection!
toRast<-raster(t(imageMatrix),crs = proj4)
#7. Save it as a new geotiff.
writeRaster(toRast, "I:/NewCraterlake.tif", "GTiff",overwrite=TRUE )

   


