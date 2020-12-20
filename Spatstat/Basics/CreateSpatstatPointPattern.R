#Example from the R help!
# some arbitrary coordinates in [0,1]
library(spatstat)
x <- runif(20)
y <- runif(20)
# the following are equivalent
X <- ppp(x, y, c(0,1), c(0,1))
X <- ppp(x, y)
X <- ppp(x, y, window=owin(c(0,1),c(0,1)))
# specify that the coordinates are given in metres
X <- ppp(x, y, c(0,1), c(0,1), unitname=c("metre","metres"))