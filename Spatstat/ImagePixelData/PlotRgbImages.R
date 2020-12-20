# RScript - please enter your code here !
#Transfer a RGB image in RGB mode as a RGB matrix!
library(spatstat)
#Here we already transformed the vector data to 'European' for spatstat!
imageMatrixR<-matrix(imageMatrix[,1],nrow=imageSizeY,ncol=imageSizeX,byrow=TRUE)
imageMatrixG<-matrix(imageMatrix[,2],nrow=imageSizeY,ncol=imageSizeX,byrow=TRUE)
imageMatrixB<-matrix(imageMatrix[,3],nrow=imageSizeY,ncol=imageSizeX,byrow=TRUE)

R <- as.im(imageMatrixR)
G <- as.im(imageMatrixG)
B <- as.im(imageMatrixB)
RGB<-rgbim(R, G, B, maxColorValue=255, autoscale=FALSE)
#RGB <- rgbim(r, g, b)
#plot(RGB, useRaster = TRUE)
plot(RGB,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),main="Example")
#require(grDevices)  # for colours
#image(imageMatrix, useRaster = TRUE) 
