#A example how to plot the density for a mark!
#Execute a Particle analysis in Bio7 to transfer the the Particles values to the R workspace.
#Here the density of the Particles area is plotted!
library(spatstat)
X<- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY),marks=Particles$Area)
plot(density(X, weights=Particles$Area))
contour(density(X, weights=Particles$Area)) 