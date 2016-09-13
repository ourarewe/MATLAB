function [Mr1,Mr2,Vr1,Vr2]=MandV_2(rho,n,N)
 
[r1,r2]=my_corr2(n,N,rho);

Mr1=mean(r1);Mr2=mean(r2);
Vr1=var(r1);Vr2=var(r2);
