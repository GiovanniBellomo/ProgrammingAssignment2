## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Set my working Directory
rm(list=ls())
setwd("C:/Users/giovanni.bellomo/Docs/Coursera MOOC/Data Science - JHU/02 - R Programming/Assignments/ProgrammingAssignment2")

makeCacheMatrix <- function(x = matrix()) {
    
    invertedMatrix <- NULL
    
    setMatrix <- function(y) {
        x <<- y
        invertedMatrix <<- NULL
    }
    getMatrix <- function() x
    setInvertedMatrix <- function(solve) invertedMatrix <<- solve
    getInvertedMatrix <- function() invertedMatrix

    list(setMatrix = setMatrix, getMatrix = getMatrix,
         setInvertedMatrix = setInvertedMatrix,
         getInvertedMatrix = getInvertedMatrix)
    
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    
    invertedMatrix <- x$getInvertedMatrix()
    if(!is.null(invertedMatrix)) {
        message("Getting cached data")
        return(invertedMatrix)
    }
    matrix <- x$getMatrix()
    invertedMatrix <- solve(matrix)
    x$setInvertedMatrix(invertedMatrix)
    invertedMatrix
    
}
