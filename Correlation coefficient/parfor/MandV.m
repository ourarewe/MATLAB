function [Mr1,Mr2,Vr1,Vr2]=MandV(rho,n,N)
 
r1=zeros(1,N);r2=r1;
parfor j=1:N 
    [X,Y]=Norm2DDis_3(0,0,1,1,rho,n);
    r1(j)=corr(X,Y);
    r2(j)=new(X,Y,r1(j));
    
end

Mr1=mean(r1);Mr2=mean(r2);
Vr1=var(r1);Vr2=var(r2);
