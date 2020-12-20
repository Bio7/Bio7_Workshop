#Create a spatstat point pattern from a ImageJ Particle analysis.
library(spatstat)
imageSizeX<-256
imageSizeY<-254
#Plot is visualized in ImageJ (Java) coordinates!
X<- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY))