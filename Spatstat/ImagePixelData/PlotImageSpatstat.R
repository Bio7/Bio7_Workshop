#Plot an ImageJ image matrix with spatstat!

library(spatstat)

imMat<-transmat(t(imageMatrix),from = "European", to = "spatstat")

im<-as.im(imMat, owin(xrange=c(0,imageSizeX), yrange=c(0,imageSizeY))) 

plot.im(im)


