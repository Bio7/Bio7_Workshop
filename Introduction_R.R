# RScript - please enter your code here !

# 3 The R Language

# This is a comment!

# Use R as a calculator
3 + 3
# [1] 6 #Output!

# Create a variable in the R workspace!
x <- 5

# List workspace variables!

ls()
# [1] 'x' #Output!

# Create a vector!
y <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
y
# [1] 1 2 3 4 5 6 7 8 9 10 #Output!

# Create 100 random numbers!
random <- runif(100)

# Create a 10 by 10 (rows, columns) matrix from the vector!
mat <- matrix(random, 10, 10)

# Display the first row of the matrix!
mat[1, ]

# Display the first column of the matrix!
mat[, 1]

# Display the ith row and jth column element of the matrix!
mat[2, 2]

# Create a sequence of numbers from 1 to 6!
a <- 1:6

# Create an 2 dimensional array from the sequence!
arr <- array(a, dim = c(3, 2))

# Create two vectors!
numbers <- c(1, 2, 3, 4, 5)  #Numbers!
characters <- c("a", "b", "c", "d", "e")  #Characters/Strings!

# Create a dataframe from the two vectors of different type!
df <- data.frame(numbers, characters)

# Create a matrix with 3 columns!
mat <- matrix(c(2, 6, 3, 8, 4, 9), ncol = 3)

# Apply a function to each value of the matrix!
apply(mat, MARGIN = c(1, 2), function(x) {x^2})

# Open the help browser to get information about the use of the runif method!
`?`(runif)

# Remove objects from the R workspace!
remove(df)

# 3.1 Statistics in R

# Create two vectors from a number sequence!
x <- 1:10
y <- 1:10

# Calculate the mean value of one vector!
mean(x)

# Calculate summary statistics of one vector!
summary(x)

# Calculate the correlation between x and y!
cor(x, y)

# Create random data vectors from a normal distribution!
x <- rnorm(100)
y <- rnorm(100)
# Test if the data is normally distributed!
shapiro.test(x)

# Calculate the linear regression!
lm(y ~ x)

# Calculate a classification tree with the package rpart with an available
# dataset!
library(rpart)
fit <- rpart(Kyphosis ~ Age + Number + Start, data = kyphosis)

# 3.2 Plots in R

# Create random numbers!
x <- runif(100)
y <- runif(100)

# Plot the x,y values!
plot(x, y)

# Create a Boxplot!
boxplot(x)

# Create a Histogramm!
hist(x)

# Create a pie chart!
pie(x)

# Create a perspective (3d) plot from a matrix!
mat <- matrix(runif(100), 10, 10)
persp(mat, main = "Plot", theta = 30, phi = 30, expand = 0.5, col = "grey")


# 4 Data Transfer and Analysis with ImageJ and R

yourdata <- read.table("C:/Results.xls")

clipboard <- read.delim("clipboard")
# On the Mac, reading from the the clipboard is:
pipe("pbpaste")
x <- read.table(pipe("pbpaste"))


# Load the image data
yourImage <- read.table("C:/Cell_Colony.txt")

# Convert the image data to a matrix!
yourImage <- as.matrix(yourImage)
# Transpose the image
yourImage <- t(yourImage)

# Plot the image data Please note that the x,y coordinates in R have their origin
# in the lower left!
image(yourImage)

# Plot the data with origin upper left!
image(yourImage, ylim = c(1, 0))

# Read the data with the more efficient scan function!
yourImage <- matrix(scan("C:/Cell_Colony.txt", n = 408 * 406), 408, 406, byrow = FALSE)

# Plot the image more efficiently with the raster graphics!
image(yourImage, useRaster = TRUE)

# Find and Replace values in the matrix!
which(yourImage == 5, arr.ind = TRUE)
imageMatrix <- replace(yourImage, which(yourImage == 2, arr.ind = TRUE), 0)  #Replaces specifie values!
ifelse(yourImage < 100, yourImage, NA)  #Replace values which smaller 100!

# Create matrices!
imageMatrix <- matrix(rep(1, 1e+06), 1000, 1000)  #Fill matrix with 1
imageMatrix <- matrix(rep(NaN, 1e+06), 1000, 1000)  #Fill matrix with NaN


# 4.1 R Analysis Example of ImageJ Data

# Load the image data from the Blobs image!
blob <- read.table("C:/Results.xls")

# We create a new dataframe from a subset of the loaded dataframe! Index for a
# dataframe starts with 1!
df <- data.frame(blob[, 1], blob[, 4], blob[, 5], blob[, 6], blob[, 12])

# Scale and center the data because of the different value ranges!
scaled <- scale(df)

# Create a euclidean distance matrix!
di <- dist(scaled, method = "euclidean")

# Cluster the data e.g. with the Ward's minimum variance method!
clust <- hclust(di, method = "ward")

# Plot the data to identify similar particles!
plot(clust)

# Get information about the clustering algorithm!
`?`(hclust)


# Install the spatstat package!
install.packages("spatstat")

# Load the library!
library(spatstat)

# Calculate the nearest neighbour distances!
nndist(blob[, 2], blob[, 3])

# Convert the x, y coordinates to a spatstat object!
points <- as.ppp(data.frame(blob[, 2], blob[, 3]), c(0, 256, 0, 254))

# Plot the points!
plot(points)

# More information about spatstat algorithms!
`?`(spatstat)
