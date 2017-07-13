# compile two functions
Rcpp::sourceCpp('rFitBspline.cpp')

# generate the data
dat <- genData()

# fit the model, returns matrix and gof measures

fit <- fitData(dat)
M <- fit[[1]]

# plot
plot(dat[, "x"], dat[,"y"], pch=19, col="#00000044")
lines(M[,1], M[, 2], col = "orange", lwd = 2)
