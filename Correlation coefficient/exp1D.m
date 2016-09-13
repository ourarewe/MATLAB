function y=exp1D(lam,n)

X=rand(1,n);
y=(-1.0/lam).*log(X);

%histfit(y,10,'exponential');
