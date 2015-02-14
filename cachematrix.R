##  1° - save this file to your working Directory or change your working directory to load cachematrix.r
#   2° - source("cachematrix.r")
#   3° - m <- makeCacheMatrix(matrix(c(2,4,6,3,4,8,9,10,22),3,3))
#   4° - cacheSolve(m)
#
#   Now you can use all methods
#
#   test:       m$getMatrix() %*% cacheSolve(m) 
#   results:    square matrix   1  0  0
#                               0  1  0
#                               0  0  1                               
#
#   It Works!

# Set my working Directory & cleare variables

# rm(list=ls())
#setwd("C:/Users/giovanni.bellomo/Docs/Coursera MOOC/Data Science - JHU/02 - R Programming/Assignments/ProgrammingAssignment2")



## As Function Name says: it creates a CHACHE MATRIX
makeCacheMatrix <- function(matrix = matrix()) {
    
    # Store inverted matrix
    invertedMatrix <- NULL
    
    # Method/Function to set up my matrix on variable called: matrix
    setMatrix <- function(y) {
        matrix <<- y
        invertedMatrix <<- NULL #also inverted matrix is set to  NULL
    }
    
    # Function/method to returm ormatrix
    getMatrix <- function() matrix
    
    # function to elaborate inverted matrix, suse function solve.
    # this function dosn't check in matrix is SQUARE or SINGULAR
    setInvertedMatrix <- function(solve) invertedMatrix <<- solve
    
    # function to return invertedMatrix
    getInvertedMatrix <- function() invertedMatrix

    # List all function
    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInvertedMatrix = setInvertedMatrix,
         getInvertedMatrix = getInvertedMatrix)
    
}


## This function chack if needed value is cached or not.
#
cacheSolve <- function(x, ...) {
    invertedMatrix <- x$getInvertedMatrix()
    # invered matrix stored in cache, return cached value
    if(!is.null(invertedMatrix)) {
        message("Getting cached data")
        return(invertedMatrix)
    }
    # ELSE - (it is not needed because i use return in the previous statement)
    # calculate inverted Matrix and store it
    # To optimze code i can zip next three row to a single line, 
    #
    #       x$setInvertedMatrix(solve(x$getMatrix()))
    #
    #   but i prefear to have a few more line to understand better code.
    
    matrix <- x$getMatrix()
    invertedMatrix <- solve(matrix)
    x$setInvertedMatrix(invertedMatrix)
    invertedMatrix
    
}
