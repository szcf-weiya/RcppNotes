#include <iostream>
#include <gsl/gsl_const_mksa.h>
#include <vector>
using namespace std;

vector<double> volumes(){
  vector<double> v(2);
  v[0] = GSL_CONST_MKSA_US_GALLON;
  v[1] = GSL_CONST_MKSA_CANADIAN_GALLON;
  return v;
}

int main()
{
  
  vector<double> v;
  v = volumes();
  /*
  double a = GSL_CONST_MKSA_US_GALLON;
  double b = GSL_CONST_MKSA_CANADIAN_GALLON;
  v.push_back(a);
  v.push_back(b);
  */
  cout << v[0] << endl
       << v[1] << endl;
  
  /*
  cout <<  GSL_CONST_MKSA_US_GALLON << endl;
  cout <<  GSL_CONST_MKSA_CANADIAN_GALLON << endl;
  */
  return 0;
}
