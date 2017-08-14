src <- '
  Rcpp::IntegerVector vec(vx);
  int prod = 1;
  for (int i=0; i<vec.size(); i++) {
    prod *= vec[i];
  }
  return Rcpp::wrap(prod);
'

library(inline)
fun <- cxxfunction(signature(vx="integer"), src, plugin="Rcpp")
cat(fun(1:10), '\n') # creates integer vector
