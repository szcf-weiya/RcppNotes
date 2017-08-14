## A function to return four perfect numbers

src <- '
  Rcpp::IntegerVector epn(4);
  epn[0] = 6;
  epn[1] = 14;
  epn[2] = 496;
  epn[3] = 8182;
  return epn;
'
library(inline)
fun <- cxxfunction(signature(), src, plugin = "Rcpp")
cat(fun(), "\n")
