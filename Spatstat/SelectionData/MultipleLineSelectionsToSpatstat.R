#RScript - please enter your code here !
library(spatstat)
#Convert the 2D list and extract the vectors.
x0<- unlist(lapply(roiXSelectionCoordinates, '[[', 1))
y0<- unlist(lapply(roiYSelectionCoordinates, '[[', 1))
x1<- unlist(lapply(roiXSelectionCoordinates, '[[', 2))
y1<- unlist(lapply(roiYSelectionCoordinates, '[[', 2))
 
#Create spatstat psp object!
lines<-psp(x0,y0, x1, y1, owin(xrange=c(0,imageSizeX), yrange=c(0,imageSizeY))) 
#Plot the lines!
plot(x = 0, y = 0,xlim=c(1,imageSizeX),ylim=c(imageSizeY,1), type = "n", main = "Lines", asp = 1, axes = F, xlab = "x", ylab = "y")

plot(lines,add = T)
#Some customizations for the plot!
axis(1)

axis(2, las = 1)