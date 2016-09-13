function [Mr1,Mr2,Vr1,Vr2]=MandV_cpp(rho,n,N)
%ÓÃcpp
[x,y]=my_makexy(n,N,rho);
mx=mean(x);my=mean(y);

r1=corrcpp(x,y,mx,my);

over0=r1>=0; under0=r1<0;
mx(under0)=-mx(under0);
over0=repmat(over0,n,1);
under0=repmat(under0,n,1);
x1(under0)=-x(under0);
x1(over0)=x(over0);
x1=reshape(x1,n,N);
sx=sort(x1); sy=sort(y);
    
r2=corrcpp(sx,sy,mx,my);
r2=r1./r2;

Mr1=mean(r1);Mr2=mean(r2);
Vr1=var(r1);Vr2=var(r2);
