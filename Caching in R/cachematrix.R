## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#This function creates a list which contains function to 
#get and set the matrix and inverse matrix values.
#This function accepts a matrix as parameter 
#and assigns it to the variable inside the function.
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y){
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
         setinverse = setinverse,
         getinverse = getinverse)
}


## Write a short comment describing this function

#This function calculates the inverse of a matrix.
#However if inverse of the same matrix was calculated previously,
#the cached data is returned.
#This function takes output of makeCacheMatrix function as parameter.
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(!is.null(i)){
    message("getting cached data")
    return (i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}