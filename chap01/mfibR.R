library(inline)
library(Rcpp)

## memoization solution courtesy of Pat Burns
mfibR <- local({
  memo <- c(1, 1, rep(NA, 2000))
  f <- function(x) {
    if (x == 0) return(0)
    if (x < 0) return(NA)
    if (x > length(memo))
      stop("x too big for implementation")
    if (!is.na(memo[x])) return(memo[x])
    ans <- f(x-2) + f(x-1)
    memo[x] <<- ans
    ans
  }
})

## memoization using C++
mincltxt <- '
#include <algorithm>
#include <stdexcept>
#include <cmath>
#include <iostream>
class Fib{
  public:
    Fib(unsigned int n = 2000){
      memo.resize(n);
      std::fill(memo.begin(), memo.end(), NAN);
      memo[0] = 0.0;
      memo[1] = 1.0;
    }
    double fibonacci(int x){
      if (x < 0)
        return ((double)NAN);
      if (x >= (int) memo.size())
        throw std::range_error(\"x too large for implementation\");
      if (! ::isnan(memo[x]))
        return(memo[x]);
      memo[x] = fibonacci(x-2) + fibonacci(x-1);
      return(memo[x]);
    }
  private:
      std::vector<double> memo;
};
'

mfibRcpp <- cxxfunction(signature(xs = "int"),
                        plugin = "Rcpp",
                        includes = mincltxt,
                        verbose = TRUE,
                        body = '
                          int x = Rcpp::as<int>(xs);
                          Fib f;
                          return Rcpp::wrap(f.fibonacci(x-1));
                        ')

print(system.time(mfibR(2000)))
print(system.time(mfibRcpp(2000)))
