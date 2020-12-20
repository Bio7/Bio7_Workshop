#Plot a greyscale image from a matrix transfer (only in double mode available!).
image(1:imageSizeX,1:imageSizeY,imageMatrix,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),axes = FALSE,useRaster=TRUE)