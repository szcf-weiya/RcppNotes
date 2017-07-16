# RcppNotes

## convert Rcpp::CharacterVector to std::string

[stackoverflow](https://stackoverflow.com/questions/8421250/convert-rcppcharactervector-to-stdstring)

```
std::string fname = Rcpp::as(f1);
// or
std::string fname = Rcpp::as<std::string>(f1);
```
