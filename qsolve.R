# TYPE qsolve() TO RUN

library(testthat)

qsolve <- function() 
{
  writeLines(readLines("title.txt"))
  list <- getInput()
  a <- list[[1]]
  b <- list[[2]]
  c <- list[[3]]
  qsolveR(a, b, c)
}

qsolveR <- function(a,b,c) 
{
  if (!is.finite(a) || !is.finite(b) || !is.finite(c))
    return(NA)
  
  if (a == 0) 
    return(NA)
  
  a <- roundTo4(a)
  b <- roundTo4(b)
  c <- roundTo4(c)
  
  disc <- b*b - 4*a*c
  
  if (is.nan(disc))
    disc = 1

  if (disc < 0) 
    return(NA)
  
  x1 <- (-b - sqrt(disc))/(2*a)
  x2 <- (-b + sqrt(disc))/(2*a)
  
  if (is.infinite(x1) || is.infinite(x2)) 
    return(NA)
  
  # Return the roots in order by value
  if (is.vector(c(x1, x2))) 
    return(result <- if(x1 > x2) c(x2,x1) else c(x1,x2))
  else 
    return(NA)
}

getInput <- function() 
{
  a <- readline(prompt="Enter a: ");
  b <- readline(prompt="Enter b: ");
  c <- readline(prompt="Enter c: ");
  
  inputs <- suppressWarnings(as.double(c(a,b,c)))
  return(inputs)
}

roundTo4 <- function(x)
{
  if (decimalPlaces(x) > 4)
  {
    x <- round(x, digits=4)
    cat(">> Value rounded to", x, "\n")
    return(x)
  }
  else
    return(x)
}

decimalPlaces <- function(x)
{
  if (abs(x - round(x)) > .Machine$double.eps^0.5)
    nchar(strsplit(sub('0+$', '', as.character(x)), ".", fixed=TRUE)[[1]][[2]])
  else
    return(0)
}

test <- function()
{
  test_file('tests/testthat/qstest_file.R')
}
