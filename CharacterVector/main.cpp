#include <Rcpp.h>
#include <fstream>
#include <string>
#include <vector>

using namespace std;

//[[Rcpp::export]]

SEXP readData(SEXP f1, int n, bool flag){
  Rcpp::CharacterVector ff(f1);
  string fname = Rcpp::as<string>(ff);
  ifstream fi;
  fi.open(fname.c_str(), ios::in);
  string line;
  fi >> line;
  Rcpp::CharacterVector rline(n);
  rline[0] = line;
  fi >> line;
  rline[1] = line;
  fi.close();

  vector<int> x, y;
  x.push_back(2);
  y.push_back(3);
    x.push_back(2);
  y.push_back(3);
  
  Rcpp::DataFrame output = Rcpp::DataFrame::create(Rcpp::Named("x")= x,
						   Rcpp::Named("y")= y);

  return output;

    
    /*
  if (flag)
    return rline;
  else
    return rline[1];
    */
}
