%非线性随机变量测试，作图
clear;clc;
n=100;

X=-50+200*rand(1,n);
%Y=-50+100*rand(1,n);
Y=-X.^3+50;
%Y=-1./(1+exp(-X));
Xs=sort(-X);
Ys=sort(Y);
r1 = pearson(X,Y);
r2 = pearson(Xs,Ys);
r=r1/r2;
rn=newcorr(X,Y);
t=1:n;
%plot(t,X,'r*',t,Y,'b+');
figure
plot(X,Y,'r+');
figure
plot(-X,Y,'g+')
figure
plot(Xs,Ys,'b+');

