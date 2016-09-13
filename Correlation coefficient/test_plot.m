%向量X,Y长度n固定，以rho做横坐标循环,计算rho均值和方差
clc;clear;
N=1000;        % N 对X，Y
n=100;       %X，Y长度
rho=-1.0:0.1:1.0;
r1=zeros(1,N);r2=r1;
Mr1=zeros(1,size(rho,2));Mr2=Mr1;Vr1=Mr1;Vr2=Mr1;V=Mr1;
for i=1:size(rho,2) 
    for j=1:N 
        [X,Y]=Norm2DDis_2(0,5,1,9,rho(i),n);
        r1(j)=pearson(X,Y);
        r2(j)=newcorr(X,Y);
    end
    Mr1(i)=mean(r1);Mr2(i)=mean(r2);
    Vr1(i)=var(r1);Vr2(i)=var(r2);
    V(i)=(1-rho(i)^2)^2/(n-1);
end

figure
Xplot=rho;
plot(Xplot,Mr1,'-r.');
hold on
plot(Xplot,Mr2,'-b.');
legend('pearson','new');
hold off
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' mean'])

figure
plot(Xplot,Vr1,'--r.');
hold on
plot(Xplot,Vr2,'-.b.');
hold on
plot(Xplot,V,'-g');
legend('pearson','new','rho');
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' var'])
