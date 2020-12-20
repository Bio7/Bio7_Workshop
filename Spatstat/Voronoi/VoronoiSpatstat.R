#This script create voronois from a transferred Particle analysis of ImageJ (centrois values).
#The areas are calculated and printed!

library(spatstat)
xrange <- c(0,imageSizeX)
yrange <- c(imageSizeY,0)
X<- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY))
#unique points, see: http://www.inside-r.org/packages/cran/spatstat/docs/dirichlet
X <- unique(X, rule="deldir")
voro<-dirichlet(X) 
#Plot in ImageJ (Java) coordinates!
plot(x = xrange, y = yrange,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1), type = "n", main = "", asp = 1, axes = F, xlab = "x", ylab = "y")
plot(voro,add = T)
plot(X,axes=TRUE,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),add = T)
#Print the voronoi areas!
print(tile.areas(voro)) #Areas


