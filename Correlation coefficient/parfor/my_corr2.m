function [r1,r2]=my_corr2(n,N,rho)
%用my_makexy产生二维标准正太分布并计算皮尔森相关系数和新相关系数,循环10次算一万个rho

[x,y]=my_makexy(n,N,rho);
r1=zeros(1,N);r2=r1;
for i=1:10
    r=corr(x(:,(10000*(i-1)+1:10000*i)),y(:,(10000*(i-1)+1:10000*i)));
    r1(10000*(i-1)+1:10000*i)=diag(r);
end

over0=r1>=0; under0=r1<0;
over0=repmat(over0,n,1);
under0=repmat(under0,n,1);
x1(under0)=-x(under0);
x1(over0)=x(over0);
x1=reshape(x1,n,N);
sx=sort(x1); sy=sort(y);
    
for i=1:10
    r=corr(sx(:,(10000*(i-1)+1:10000*i)),sy(:,(10000*(i-1)+1:10000*i)));
    r2(10000*(i-1)+1:10000*i)=diag(r);
end

r2=r1./r2;