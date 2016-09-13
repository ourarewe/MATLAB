function [x,y]=NormIndeDis(n)
u=rand(1,n);
v=rand(1,n);
x=sqrt(-2.*log(u)).*cos(2.*pi.*v);
y=sqrt(-2.*log(v)).*cos(2.*pi.*u);
