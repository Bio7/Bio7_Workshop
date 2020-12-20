#RScript - please enter your code here !

#Generate a point pattern object
library (spatstat)

# some arbitrary coordinates in [0,1]
x <- runif(20)
y <- runif(20)
# the following are equivalent
X <- ppp(x, y, c(0,1), c(0,1))
X <- ppp(x, y)
X <- ppp(x, y, window=owin(c(0,1),c(0,1)))
# specify that the coordinates are given in metres
X <- ppp(x, y, c(0,1), c(0,1), unitname=c("metre","metres"))
plot(X)


#Generate an observation (sample region) window
w <- owin(c(0,1), c(0,1))
# the unit square
w <- owin(c(10,20), c(10,30), unitname=c("foot","feet"))
# a rectangle of dimensions 10 x 20 feet
# with lower left corner at (10,10)
plot(w)

# polygon (diamond shape)
w <- owin(poly=list(x=c(0.5,1,0.5,0),y=c(0,1,2,1)))
w <- owin(c(0,1), c(0,2), poly=list(x=c(0.5,1,0.5,0),y=c(0,1,2,1)))
# polygon with hole
  ho <- owin(poly=list(list(x=c(0,1,1,0), y=c(0,0,1,1)),
     list(x=c(0.6,0.4,0.4,0.6), y=c(0.2,0.2,0.4,0.4))))
plot(ho)
     
#Create and plot example dataset
data(swedishpines)
X<-swedishpines
plot(X)

#Nearest neighbour
summary(X)
nearest<-nndist(X)
summary(nearest)

#Finds the nearest neighbour of each point in a point pattern and plot.
data(cells)
m <- nnwhich(cells)
m2 <- nnwhich(cells, k=2)
#Plot nearest neighbour links
b <- cells[m]
plot(cells)
arrows(cells$x, cells$y, b$x, b$y, angle=15, length=0.15, col="red")

#Density plot
plot(density(swedishpines, 10))

#Contour  plot
contour(density(X,10), axes=FALSE)

#From a particle analysis
library(spatstat)
imageSizeX<-256
imageSizeY<-254
#Plot is visualized in ImageJ (Java) coordinates!
X<- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY))
plot(x = 1, y = 1,xlim=c(0,imageSizeX),ylim=c(imageSizeY,0), type = "n", main = "blobs.gif", asp = 1, axes = F, xlab = "x", ylab = "y")
plot(X,axes=TRUE,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1),add = T)
axis(1)
axis(2, las = 2)

#Plot as overlay
imMat<-t(imageMatrix)
im<-as.im(imMat, owin(xrange=c(0,imageSizeX), yrange=c(0,imageSizeY)))
#Plot is visualized in ImageJ (Java) coordinates!
plot(x = 1, y = 1,xlim=c(0,imageSizeX),ylim=c(imageSizeY,0), type = "n", main = "", asp = 1, axes = F, xlab = "x", ylab = "y")
plot.im(im,add=T)
plot(X,xlim=c(0,imageSizeX),ylim=c(imageSizeY,0),add = T)

#Create window from spatialPolygons object
library(maptools)
library(spatstat)
polWin<-as(spatialPolygons, "owin")
plot(polWin)

#Create ppp object with window and points
X<- ppp(Particles$X, Particles$Y,window=polWin)
plot(X)

# marks
m <- sample(1:2, 20, replace=TRUE)
m <- factor(m, levels=1:2)
X <- ppp(x, y, c(0,1), c(0,1), marks=m)
plot(X)

#Create marks from SpatialPointsDataframe
library(maptools)
library(spatstat)
spatialPointsDF<-as(spatialPointsDataFrame, "ppp")
plot(spatialPointsDF)
summary(spatialPointsDF)

#Covariates
data(bei)
slope <- bei.extra$grad
par(mfrow = c(1, 2))
plot(bei)
plot(slope)

#Quadrat count:

data(bei)
Z <- bei.extra$grad
b <- quantile(Z, probs = (0:4)/4)
Zcut <- cut(Z, breaks = b, labels = 1:4)
V <- tess(image = Zcut)
plot(V)
plot(bei, add = TRUE, pch = "+")

#Tesselated:

qb <- quadratcount(bei, tess = V)
plot(qb)

#Estimate of intensity
plot(rhohat(bei, slope))

#Quadrat count
Q <- quadratcount(X, nx = 4, ny = 3)
Q
plot(X)
plot(Q, add = TRUE, cex = 2)

#Ripley’s K function

K <- Kest(X)
plot(K)

#L function
L <- Lest(X)
plot(L, main = "L function")

#Envelope
ENV <- envelope(Y = swedishpines, fun = Kest, nsim = 40)
plot(ENV)
ENVL <- envelope(Y = swedishpines, fun = Lest, nsim = 40)
plot(ENVL)

#Line patterns
linePattern <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
plot(linePattern)

#Dirichlet Tessalation
X <- runifpoint(42)
plot(dirichlet(X))
plot(X, add=TRUE)

#Point patterns in 3D
threeDPpp <- pp3(runif(10), runif(10), runif(10), box3(c(0,1)))
plot(threeDPpp)

#Nearest neighbour measurements in 3D
nndist(threeDPpp)

#Ripleys K in 3D
threeDPppKest <- K3est(threeDPpp)
plot(threeDPppKest)

#Point pattern example on a Linear Network
data(simplenet)
Xlin <- rpoislpp(5, simplenet)
plot(Xlin)
linearK(Xlin)
linearK(Xlin, correction="none")

#Fit a point process model to an observed point pattern. 
# fit the stationary Poisson process
# to point pattern 'nztrees'
data(nztrees)
fitted<-ppm(nztrees)
modelFitted<-rmh(fitted)
plot(modelFitted, main="Fitted Model")


