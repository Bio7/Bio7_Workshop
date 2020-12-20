#A 3D point pattern example from the values of an ImageJ results table!

library(spatstat)
#X <- pp3(runif(10), runif(10), runif(10), box3(c(0,1)))
#Here we create the area of analysis for the 3D pattern!
#Values are taken from the calibrated *tiff ImageJ image info!
win<-box3(c(0,684.9333),c(0,684.9333),c(3.947,225), unitname=c("µm"))

#In uncalibrated images we calculate slice*Z unit:
#distance<-3.9474
#X<- pp3(Particles$X, Particles$Y,Particles$Slice*distance, win)

#Else we take the values from the results table!:
X<- pp3(IJResultsTable$X, IJResultsTable$Y,IJResultsTable$Slice, win)
#plot(x = xrange, y = yrange,z=zrange,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),zlim=c(1,Z), type = "n", main = "", asp = 1, axes = F, xlab = "x", ylab = "y",zlab="z")
plot(X,main="3D",cex=1.5, pch=16)

#We could also calculate some other measures!
#nndist.pp3(X)
#plot(K3est(X), main="K-function in 3D")
#plot(X, main="3D point pattern X")
#plot(G3est(X), main="G-function in 3D", legendpos="bottomright")

