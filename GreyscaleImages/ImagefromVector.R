#An example how to plot an greyscale image from a ImageJ to R vector transfer!
#From the vector a matrix is created for plotting!
imageMatrixFinal<-matrix(imageMatrix,nrow=imageSizeX,ncol=imageSizeY,byrow=FALSE)
#Plot in ImageJ (Java) coordinates!
image(1:imageSizeX,1:imageSizeY,imageMatrixFinal,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),axes = TRUE,useRaster=TRUE)
