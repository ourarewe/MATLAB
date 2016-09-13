clear;clc;
N=10;
n=10000;


    X=randn(1,n);
    Y=randn(1,n);
    Xs=sort(X);
    Ys=sort(Y);

    Xm=mean(X);
    Ym=mean(Y);
    r1=0.0;r2=0;
    for i=1:size(X,2)
        r1=r1+(X(i)-Xm)*(Y(i)-Ym);
        r2=r2+(Xs(i)-Xm)*(Ys(i)-Ym);
    end
    r=r1/r2;
M=mean(r1) 
MM=M/(n-1)
cov(X,Y)   
   
    