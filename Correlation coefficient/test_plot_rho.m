%以rho做横坐标循环
clc;clear;
n=10000;
N=11;
r1=zeros(1,N);
r2=zeros(1,N);
r3=zeros(1,N);
i=1;
rho=-1.0:0.1:1.0;
for i=1:size(rho,2)  
    %Y=rho.*X+sqrt(1-rho^2).*Y; 
    [X,Y]=Norm2DDis_2(0,0,1,1,rho(i),n);
    r1(i)=pearson(X,Y);
    Xs=sort(X);
    Ys=sort(Y);
    %r2(i)=new(X,Y);
    r2(i)=pearson(Xs,Ys);
    r3(i)=r1(i)/r2(i);
    %i=i+1;
end

Xplot=rho;
plot(Xplot,r1,'--rs');
hold on
plot(Xplot,r3,'-.bs');
legend('pearson','new');