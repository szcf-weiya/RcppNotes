#include <Rcpp.h>
#include <fstream>
#include <string>

using namespace std;

//[[Rcpp::export]]

SEXP readData(SEXP f1){
  Rcpp::CharacterVector ff(f1);
  string fname = Rcpp::as<string>(ff);
  ifstream fi;
  fi.open(fname.c_str(), ios::in);
  string line;
  fi >> line;
  Rcpp::CharacterVector rline(2);
  rline[0] = line;
  fi >> line;
  rline[1] = line;
  fi.close();
  return rline;
}
