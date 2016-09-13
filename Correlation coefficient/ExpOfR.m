function [rp,rn]=ExpOfR(X,Y,N)
%fault
if nargin<3, N = 1000;end

r1=zeros(1,N);
r2=zeros(1,N);
for i=1:N;
    r1(i)=pearson(X,Y);
    r2(i)=new(X,Y);
end

rp=mean(r1);rn=mean(r2);
%V=(1-rho^2)^2/(n-1);
%Vr1=var(r1);
%Vr2=var(r2);
