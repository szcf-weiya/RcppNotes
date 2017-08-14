library(Rcpp)
dyn.load("mypnorm.so")
test <- function(xx){
  .Call("mypnorm", xx)
}
