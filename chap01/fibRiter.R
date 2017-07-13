## linear / iterative solution
fibRiter <- function(n) {
  first <- 0
  second <- 1
  third <- 0
  for (i in seq_len(n)) {
    third <- first + second
    first <- second
    second <- third
  }
  return(first)
}

## linear / iterative solution
fibRcppIter <- cxxfunction(signature(xs="int"),
                           plugin="Rcpp",
                           body='
                           int n = Rcpp::as<int>(xs);
                           double first = 0;
                           double second = 1;
                           double third = 0;
                           for (int i=0; i<n; i++) {
                             third = first + second;
                             first = second;
                             second = third;
                           }
                           return Rcpp::wrap(first);
                           ')

print(system.time(fibRiter(10000)))
print(system.time(fibRcppIter(10000)))