#With the glcm package you can calculate some texture metrics.
library(glcm)
#Possible texture calculations are: "mean", "variance", "homogeneity", "contrast", "dissimilarity", "entropy","second_moment", "correlation"
#You can transfer this matrix back to ImageJ with the Image-Methods dialog, e.g., to include in a classification task!
result<-glcm(imageMatrix, statistics=c("second_moment"))