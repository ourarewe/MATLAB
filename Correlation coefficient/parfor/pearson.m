function r = pearson(X,Y)

Xm=mean(X);
Ym=mean(Y);

r1=0.0;r2=0.0;r3=0.0;
size(X,1)
for i=1:size(X,1)
    m=X(i)-Xm; n=Y(i)-Ym;
    r1=r1+m*n; r2=r2+m^2; r3=r3+n^2;
end
r=r1/sqrt(r2*r3);