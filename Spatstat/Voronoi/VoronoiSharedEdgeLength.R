#RScript - please enter your code here !
#Example from: http://stackoverflow.com/questions/24317733/table-of-shared-edges-for-a-voronoi-tesslleation

library(spatstat)
library(deldir)
points <- ppp(Particles$X, Particles$Y, c(0,imageSizeX), c(0,imageSizeY))

sharededge <- function(X) {
   verifyclass(X, "ppp")
   Y <- X[as.rectangle(X)]
   dX <- deldir(Y)
   DS <- dX$dirsgs
   xyxy <- DS[,1:4]
   names(xyxy) <- c("x0","y0","x1","y1")
   sX <- as.psp(xyxy,window=dX$rw)
   marks(sX) <- 1:nobjects(sX)
   sX <- sX[as.owin(X)]
   tX <- tapply(lengths.psp(sX), marks(sX), sum)
   jj <- as.integer(names(tX))
   ans <- data.frame(ind1=DS[jj,5], 
                     ind2=DS[jj,6], 
                     leng=as.numeric(tX))
   return(ans)
}

shared_edge_lengths <- sharededge(points)