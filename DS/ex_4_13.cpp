#include <Rcpp.h>

extern "C" SEXP mypnorm(SEXP xx){
  if(Rf_isNull(xx))
    return R_NilValue;
  Rcpp::NumericVector x(xx);
  int n = x.size();
  Rcpp::NumericVector y1(n), y2(n), y3(n);

  for (int i = 0; i < n; i ++)
  {
    y1[i] = ::Rf_pnorm5(x[i], 0.0, 1.0, 1, 0);
    y2[i] = R::pnorm(x[i], 0.0, 1.0, 1, 0);

  }
  y3 = Rcpp::pnorm(x);
  return Rcpp::DataFrame::create(Rcpp::Named("R") = y1,
                                 Rcpp::Named("Rf_") = y2,
                                 Rcpp::Named("sugar") = y3);
}
