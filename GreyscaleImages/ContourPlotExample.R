#Here we plot an image from an image matrix (double transfer mode)
image(1:imageSizeX,1:imageSizeY,imageMatrix,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),axes = FALSE)
#This is how we  add a contour plot on the image!
contour(1:imageSizeX,1:imageSizeY,imageMatrix,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),add=TRUE)

