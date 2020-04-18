# Chandler Klein
# Qsolve Function
#
# The function qsolve(a, b, c)
# solves the quadratic equation
#     a x^2 + b x + c = 0
# for real solutions x1 and x2

# Input:
#     a, b and c are finite numeric real numbers
#     a != 0
#     length of c is not greater than 1

# Return:
#     c(x1, x2) where x1 and x2 are finite 
#               numeric real numbers
#               x1 <= x2
#     NA        if the input is not as expected or 
#               the return values can not be computed 
#               as expected. 

library(testthat)

qsolve <- function() {
  writeLines(readLines("title.txt"))
  
  list <- getInput()
  a <- list[[1]]
  b <- list[[2]]
  c <- list[[3]]
  
  qsolveR(a, b, c)
}

qsolveR <- function(a,b,c) {
  
  if (!is.finite(a) || !is.finite(b) || !is.finite(c)) {
    return(NA)
  }
  
  if (a == 0) {
    return(NA)
  }
  
  if (length(c) > 1) {
    return(NA)
  }
  
  disc <- b^2 - 4*a*c
  if (is.nan(disc)) {
    disc = 1
  }
  if (disc < 0) {
    return(NA)
  }
  
  x1 <- (-b - sqrt(disc))/(2*a)
  x2 <- (-b + sqrt(disc))/(2*a)
  
  if (is.infinite(x1) || is.infinite(x2)) {
    return(NA)
  }
  
  if (is.vector(c(x1, x2))) {
    if (x1 > x2) {
      return (c(x2, x1))
    } else {
      return (c(x1, x2))
    }
  } else {
    return (NA)
  }
  
}

getInput <- function() {
  a <- readline(prompt="Enter a: ");
  b <- readline(prompt="Enter b: ");
  c <- readline(prompt="Enter c: ");
  
  inputs <- suppressWarnings(as.double(c(a, b, c)))
  return(inputs)
}

test_file('tests/testthat/qstest_file.R')