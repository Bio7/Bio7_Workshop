# RScript - please enter your code here !
library(maptools)
library(spatstat)
linesPSP <- as(spatialLines, "psp")
out <- lapply(spatialLines@lines, function(z) {
    lapply(z@Lines, as.psp)
})
curvegroup <- lapply(out, function(z) {
    do.call("superimposePSP", z)
})
results <- NULL
xcount <- 1
ycount<-2

while(xcount<=length(curvegroup)) {
    
    
   while(ycount<=length(curvegroup)) {
       
        results <- c(results, min(crossdist.psp(curvegroup[[xcount]], curvegroup[[ycount]], 
            type = "separation")))
            print(ycount)
          ycount<-ycount+1
    }
    
    print(xcount)
    xcount<-xcount+1;
    ycount<-xcount+1
} 
