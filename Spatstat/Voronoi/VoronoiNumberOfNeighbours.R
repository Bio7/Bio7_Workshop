#RScript - please enter your code here !
#Example from: http://stackoverflow.com/questions/24317733/table-of-shared-edges-for-a-voronoi-tesslleation
#Gives the number of  voronoi neighbours!
require(deldir)
x <- Particles$X
y <- Particles$Y
rw <- c(0,imageSizeX,0,imageSizeY)
require(deldir)
dxy <- deldir(x,y,rw=rw)
plot(x = xrange, y = yrange,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1), type = "n", main = "", asp = 1, axes = T, xlab = "x", ylab = "y")
plot(dxy,add=T)
dxy$summary$n.tside