#include <RcppGSL.h>
#include <gsl/gsl_multifit.h>
#include <cmath>

extern "C" SEXP fastLm(SEXP ys, SEXP Xs)
{
  try {
    RcppGSL::vector<double> y = ys;
    RcppGSL::matrix<double> X = Xs;
    
    int n = X.nrow(), k = X.ncol();
    double chisq;
    
    RcppGSL::vector<double> coef(k);
    RcppGSL::matrix<double> cov(k, k);
    
    gsl_multifit_linear_workspace *work = gsl_multifit_linear_alloc(n, k);
    gsl_multifit_linear(X, y, coef, cov, &chisq, work);
    gsl_multifit_linear_free(work);
    
    gsl_vector_view diag = gsl_matrix_diagonal(cov);
    
    Rcpp::NumericVector std_err; 
    std_err = diag;
    std::transform(std_err.begin(), std_err.end(), std_err.begin(), sqrt);
    
    Rcpp::List res = Rcpp::List::create(Rcpp::Named("coefficients") = coef,
                                        Rcpp::Named("stderr") = std_err,
                                        Rcpp::Named("df") = n-k);
    coef.free();
    cov.free();
    y.free();
    X.free();
    return res;
  }catch(std::exception &ex){
    forward_exception_to_r(ex);
  }catch(...){
    ::Rf_error("C++ exception (unknown reason)");
  }
  return R_NilValue;
}