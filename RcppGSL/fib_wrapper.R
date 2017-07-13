#include <Rcpp.h>
extern "C" SEXP fibWrapper(SEXP xs){
  int x = Rcpp::as<int> (xs);
  int fib = fibonacci(x);
  return(Rcpp::wrap(fib));
}