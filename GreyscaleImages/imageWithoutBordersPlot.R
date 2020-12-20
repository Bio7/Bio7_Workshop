#RScript - please enter your code here !
#An example how to plot an greyscale image from an ImageJ to R (matrix transfer) without borders!
par(mar = c(0,0,0,0))
image(1:imageSizeX,1:imageSizeY,imageMatrix,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),axes = FALSE,useRaster=TRUE)
