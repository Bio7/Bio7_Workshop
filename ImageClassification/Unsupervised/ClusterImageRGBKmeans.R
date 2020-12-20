#Transfer RGB image in RGB mode!
#After execution transfer back to ImageJ in double mode (as float image).
df <- data.frame(imageMatrix[,1],imageMatrix[,2],imageMatrix[,3])#convert image data to data frame
kl <- kmeans(df, 6)
imageMatrixResult<-matrix(as.double(kl$cluster),imageSizeX,imageSizeY)#convert to a matrix (width of image, height of image)
#Plot without border. 
par(mar = c(0,0,0,0))
image(1:imageSizeX,1:imageSizeY,imageMatrixResult,useRaster=TRUE,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),col = terrain.colors(6))