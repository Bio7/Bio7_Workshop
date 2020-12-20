#Plot an RGB image with the raster library !
library(raster)

require(grDevices)
#convert the RGB matrix to a color object with alpha value!
rgbImage<-rgb(imageMatrix[,1]/255,imageMatrix[,2]/255,imageMatrix[,3]/255,1.0)

rgbMat<-matrix(rgbImage,nrow=imageSizeY,ncol=imageSizeX,byrow=T)
#rgbMatFinal <- apply(rgbMat, 2, rev)#Flip the matrix horizontally!
image <- as.raster(rgbMat)
#No borders!
par(mar = c(0,0,0,0))
#plot the image without  interpolation!
#plot(c(0, imageSizeX), c(0, imageSizeY), xlim=c(0,imageSizeX),ylim=c(0,imageSizeY),type = "n", xlab = "", ylab = "")
#Plot the image. Avoid interpolation!
plot(image,interpolate=F)