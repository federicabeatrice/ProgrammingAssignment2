## The following functions cache the inverse of a matrix

## This function creates a special "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        my_set <- function(y) {
                x <<- y
                i <<- NULL
        }
        my_get <- function(){
                x       
        }
        my_setInverse <- function(inv){
                i <<- inv        
        }
        my_getInverse <- function(){
                i       
        }
        list(set = my_set, get = my_get,
             setInverse = my_setInverse,
             getInverse = my_getInverse)
}


        ## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.  If the inverse has already been calculated (and the matrix has not changed), then the cachesolve should etrieve the inverse from cash.
        
        cacheSolve <- function(x, ...) {
                s <- x$getInverse()
                if(!is.null(s)) {
                        message("getting cached data")
                        return(s)
                }
                data <- x$get()
                s <- solve(data, ...)
                x$setInverse(s)
                s 
        }        