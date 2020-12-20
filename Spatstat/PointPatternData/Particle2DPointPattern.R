#RScript - please enter your code here !
library(spatstat)
#par(mar = c(0,0,0,0))
X<- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY))
plot(x = 1, y = 1,xlim=c(0,imageSizeX),ylim=c(imageSizeY,0), type = "n", main = "", asp = 1, axes = F, xlab = "x", ylab = "y")
plot(X,axes=TRUE,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),add = T)
axis(1)
axis(2, las = 2)

