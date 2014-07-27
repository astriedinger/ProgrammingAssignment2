## Dear all, the next functions are exactly as the example provided with a minor modification.
## This was the simplest way I found to solve the assignment. The two functions below will make a matrix, and cache its inverse
## The inverse is calculated, and if the inverse is needed again, the value will be read and given from the cache =)


## Hence, the function makeCacheMatrix creates special matrix that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
      m <- NULL
      set <- function(){
            x <<- y
            m <<- NULL
      }
      get <- function() x
      setinverse <- function(solve) m <<-solve
      getinverse <- function() m
      list (set = set, get = get, setinverse = setinverse, getinverse = getinverse)
      
}


## This second function (cacheSolve) will compute the inverse of the previous special matrix 
## (provided by makeCacheMatrix) and return it to the user.
## In the case the inverse has already been calculated, the function will use the value 
## stored in the cahe and return this value to the user

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
      m <- x$getinverse()
      if(!is.null(m)){
            message("inverse matrix from cache data")
            return(m)
      }
      data <- x$get()
      m <- solve(data, ...)
      x$setinverse(m)
}
