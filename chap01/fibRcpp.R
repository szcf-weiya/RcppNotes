## we need a pure C/C++ function as the generated function
## will have a random identifier at the C++ level preventing
## us from direct recursive calls
library(inline)
incltxt <- '
int fibonacci(const int x) {
if (x == 0) return(0);
if (x == 1) return(1);
return fibonacci(x - 1) + fibonacci(x - 2);
}'

## now use the snipped above as well as one argument conversion
## in as well as out to provide Fibonacci numbers via C++

fibRcpp <- cxxfunction(signature (xs="int"),
                       plugin="Rcpp",
                       incl = incltxt,
                       body = '
  int x = Rcpp::as<int>(xs);
  return Rcpp::wrap(fibonacci(x));
')

fibR <- function(n)
  {
    if (n == 0) return(0)
    if (n == 1) return(1)
    return (fibR(n-1) + fibR(n-2))
  }
