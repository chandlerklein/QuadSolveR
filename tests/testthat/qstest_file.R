# qstest_file.R
#
# Run this as
#   library(testthat)
#   test_file("qstest_file.R")

#############
context("Simple Roots, Exact values expected")
test_that(
"Exact roots 1 and 1",
{
 # set two real roots
 ex1 <- 1
 ex2 <- 1
 # compute a, b and c
 a <- 1
 b <- -(ex1 + ex2)
 c <- ex1 * ex2
 ox <- qsolveR(a,b,c)
 expect_true(is.numeric(ox) && (length(ox)==2))
 expect_equal(object=ox[1], expected=ex1, tolerance=1)
 expect_equal(object=ox[2], expected=ex2, tolerance=1)
}
) 

test_that(
"Exact roots 1 and 2",
{
 # set two real roots
 ex1 <- 1
 ex2 <- 2
 # compute a, b and c
 a <- 1
 b <- -(ex1 + ex2)
 c <- ex1 * ex2
 ox <- qsolveR(a,b,c) 
 expect_true(is.numeric(ox) && (length(ox)==2))
 expect_equal(object=ox[1], expected=ex1, tolerance=1)
 expect_equal(object=ox[2], expected=ex2, tolerance=1)
}
) 

test_that(
"Exact roots -2 and -1",
{
 # set two real roots
 ex1 <- -2
 ex2 <- -1
 # compute a, b and c
 a <- 1
 b <- -(ex1 + ex2)
 c <- ex1 * ex2
 ox <- qsolveR(a,b,c) 
 expect_true(is.numeric(ox) && (length(ox)==2))
 expect_equal(object=ox[1], expected=ex1, tolerance=1)
 expect_equal(object=ox[2], expected=ex2, tolerance=1)
}
) 
#############
context("Simple Roots, not exact")
test_that(
"Roots 1 and 1.1",
{
# set two real roots
 ex1 <- 1
 ex2 <- 1.1
 # compute a, b and c
 a <- 1
 b <- -(ex1 + ex2)
 c <- ex1 * ex2
 ox <- qsolveR(a,b,c) 
 expect_true(is.numeric(ox) && (length(ox)==2))
 expect_equal(object=ox[1], expected=ex1, tolerance=1e-15, scale=ex1)
 expect_equal(object=ox[2], expected=ex2, tolerance=1e-15, scale=ex2)
}
) 

# test_that(
# "Roots -1.1 and 1",
# {
# # set two real roots
#  ex1 <- -1.1
#  ex2 <- -1
#  # compute a, b and c
#  a <- 1
#  b <- -(ex1 + ex2)
#  c <- ex1 * ex2
#  ox <- qsolveR(a,b,c) 
#  expect_true(is.numeric(ox) && (length(ox)==2))
#  expect_equal(object=ox[1], expected=ex1, tolerance=1e-15, scale=ex1)
#  expect_equal(object=ox[2], expected=ex2, tolerance=1e-15, scale=ex2)
# }
# ) 

# test_that(
# "Roots -1.1e100 and 1e100",
# {
# # set two real roots
#  ex1 <- -1.1e100
#  ex2 <- -1e100
#  # compute a, b and c
#  a <- 1
#  b <- -(ex1 + ex2)
#  c <- ex1 * ex2
#  ox <- qsolveR(a,b,c) 
#  expect_true(is.numeric(ox) && (length(ox)==2))
#  expect_equal(object=ox[1], expected=ex1, tolerance=1e-15, scale=ex1)
#  expect_equal(object=ox[2], expected=ex2, tolerance=1e-15, scale=ex2)
# }
# ) 

#############
context("Inf as input")
test_that(
"a == Inf",
{
# set a b c
 a <- Inf
 b <- 2 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

test_that(
"b == Inf",
{
# set a b c
 a <- 1
 b <- Inf 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

test_that(
"c == Inf",
{
# set a b c
 a <- 1
 b <- 2 
 c <- Inf
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

##################
context("-Inf as input")
test_that(
"a == -Inf",
{
# set a b c
 a <- -Inf
 b <- 2 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

test_that(
"b == -Inf",
{
# set a b c
 a <- 1
 b <- -Inf 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

test_that(
"c == -Inf",
{
# set a b c
 a <- 1
 b <- 2 
 c <- -Inf
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

######################
context("Nan as input")
test_that(
"a == NaN",
{
# set a b c
 a <- NaN
 b <- 2 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

context("0 as input")
test_that(
  "a == 0",
  {
    # set a b c
    a <- 0
    b <- 2 
    c <- 1
    ox <- qsolveR(a,b,c) 
    expect_true(is.na(ox) && (length(ox)==1))
  }
) 

test_that(
"b == NaN",
{
# set a b c
 a <- 1
 b <- NaN 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

test_that(
"c == NaN",
{
# set a b c
 a <- 1
 b <- 2 
 c <- NaN
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

######################
context("non scaler as input")
test_that(
"c == c(1,2)",
{
# set a b c
 a <- 1
 b <- 2 
 c <- c(1,3)
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
)

#############
context("String input")
test_that(
"a == \"fred\"",
{
# set a b c
 a <- "fred"
 b <- 2 
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
) 

######################
context("possible internal overflow")
test_that(
" 1, 2e300 1",
{
# set a b c
 a <- 1
 b <- 2e300
 c <- 1
 ox <- qsolveR(a,b,c) 
 expect_true(is.na(ox) && (length(ox)==1))
}
)

test_that(
" 1e300, 2e300 1e300",
{
ex1 = 1.0
ex2 = 1.0
# set a b c
 a <- 1e300
 b <- -2e300
 c <- 1e300
 ox <- qsolveR(a,b,c) 
 expect_true(is.numeric(ox) && (length(ox)==2))
 expect_equal(object=ox[1], expected=ex1, tolerance=1e-15, scale=ex1)
 expect_equal(object=ox[2], expected=ex2, tolerance=1e-15, scale=ex2)
}
)

