# Plot RGB images with ggplot2.
library(ggplot2)
#Here we need a data frame as the image data.
RedGreenBlue <- data.frame(x = rep(1:imageSizeX, imageSizeY),y = rep(1:imageSizeY,  each = imageSizeX),R = (imageMatrix[, 1]/255), G = (imageMatrix[, 2]/255), B = (imageMatrix[,3]/255))  #convert image data to data frame
#Plot the result in ImageJ (Java) coordinates.
ggplot(data = RedGreenBlue, aes(x = x, y = y)) + geom_point(colour = rgb(RedGreenBlue[c("R", "G", "B")])) + labs(title = "FluorescentCells") + xlab("x") + 
ylab("y")+ scale_y_reverse( lim=c(imageSizeY,0))
