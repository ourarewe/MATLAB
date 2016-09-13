%矩阵形式计算,my_corr2好卡
clear;clc;
tic;
N=100000;
n=20;
rho=-1.0:0.1:1.0;
Mr1=zeros(1,size(rho,2));Mr2=Mr1;Vr1=Mr1;Vr2=Mr1;V=Mr1;

parfor i=1:size(rho,2)
    [Mr1(i),Mr2(i),Vr1(i),Vr2(i)]=MandV_2(rho(i),n,N);
    V(i)=(1-rho(i)^2)^2/(n-1);
    i
end

figure
Xplot=rho;
plot(Xplot,Mr1,'-r.');
hold on
plot(Xplot,Mr2,'-b.');
legend('pearson','new');
hold off
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' mean']);
xlabel('rho'),ylabel('E(rho)');

figure
plot(Xplot,Vr1,'--r.');
hold on
plot(Xplot,Vr2,'-.b.');
hold on
plot(Xplot,V,'-g');
legend('pearson','new','rho');
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' var']);
xlabel('rho'),ylabel('Var(rho)');

toc