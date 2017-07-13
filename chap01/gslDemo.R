gslrng <- '
  int seed = Rcpp::as<int>(par) ;
  gsl_rng_env_setup();
  gsl_rng *r = gsl_rng_alloc (gsl_rng_default);
  gsl_rng_set (r, (unsigned long) seed);
  double v = gsl_rng_get (r);
  gsl_rng_free(r);
  return Rcpp::wrap(v);
'

plug <- Rcpp:::Rcpp.plugin.maker(
  include.before = "#include <gsl/gsl_rng.h>",
  libs = paste("-L/home/weiya/R/x86_64-pc-linux-gnu-library/3.3/Rcpp/libs ",
               "-lRcpp -Wl -rpath ",
               "/home/weiya/R/x86_64-pc-linux-gnu-library/3.3/Rcpp/libs ",
               "-L/usr/lib/x86_64-linux-gnu -lgsl -lgslcblas -lm", sep="")
)

registerPlugin("gslDemo", plug)
fun <- cxxfunction(signature(par="numeric"),
                   gslrng, plugin = "gslDemo")