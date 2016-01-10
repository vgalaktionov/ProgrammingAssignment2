## This is a pair of functions for setting a special matrix object that can cache its own inverse.

## this returns a list of functions that sets a matrix, retrieves the matrix, sets the inverse and retrieves the inverse

makeCacheMatrix <- function(x = matrix()) { ## To use, assign this function to a variable
  m <- NULL
  set <- function(y) { ## can be called by using your_variable$set. sets the matrix to use in the other function
    x <<- y
    m <<- NULL
  }
  
  get <- function() x ## retrieves value of set
  setinverse <- function(solve) m <<- solve ## calculates the inverse by using the solve function
  getinverse <- function() m ## retrieves value of getinverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This checks if the inverse is already cached. If yes, it returns cached value, if not, it calculates the inverse.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()  
  if(!is.null(m)) { ## returns cached value if your_variable$setinverse has already ran and matrix is unchanged
    message("getting cached data")
    return(m)
  }
  data <- x$get() ## gets the matrix by calling your_variable$get
  m <- solve(data, ...) ## calculates the inverse
  x$setinverse(m) ## caches the inverse
  m
}
