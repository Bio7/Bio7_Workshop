# RScript - please enter your code here !
library(spatstat)
imageMatrixFinal<-matrix(imageMatrix,nrow=imageSizeY,ncol=imageSizeX,byrow=TRUE)
imSpatstat<-as.im(transmat(imageMatrixFinal,from = "European", to = "spatstat"))
plot(imSpatstat)
