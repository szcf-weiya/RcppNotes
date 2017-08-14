PKG_CXXFLAGS=$(shell Rscript -e 'Rcpp:::CxxFlags()')
#PKG_LIBS=$(shell Rscript -e 'Rcpp:::LdFlags()')
PKG_LIBS=-L/home/weiya/R/x86_64-pc-linux-gnu-library/library/Rcpp/libs

mypnorm.so: mypnorm.o
	g++ -shared -o $@ $^ \
			$(PKG_LIBS) -lRcpp \
			-L/usr/lib/R/lib -lR

mypnorm.o: ex_4_13.cpp
	g++ -I/usr/share/R/include -DNDEBUG \
	    $(PKG_CXXFLAGS) \
			-fpic -g -O3 -Wall -c $^ -o $@
