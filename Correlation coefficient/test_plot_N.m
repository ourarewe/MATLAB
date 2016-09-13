%以X,Y长度n为横坐标做循环
clc;clear;
N=10;
rho=0.5;
r1=zeros(1,N);
r2=zeros(1,N);
for i=1:N;
    n=i*100;
    X=randn(1,n); 
    %Y=-50+200*rand(1,n);
    Y=X.^3;
    %[X,Y]=Norm2DDis_2(0,0,1,1,rho,n);
    r1(i)=pearson(X,Y);
    r2(i)=new(X,Y);
end

figure
plot(X,Y,'r*');
figure
Xplot=1:N;
plot(Xplot,r1,'--rs');
hold on
plot(Xplot,r2,'-.bs');
legend('pearson','new');