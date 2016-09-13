% Fig.5 Relations between real rho and rho under NM

clear;clc;
load sixsignals.mat;

N=100;
beta=2;
rho=-1.0:0.1:1.0;
numrho = size(rho,2);
noise=randn(1000,N);
%r1=zeros(1,size(rho,2));r2=r1;
Er1=zeros(1,numrho);Er2=Er1;
str1='sixsignals.';
str2='St';
x=eval([str1,str2]);
tx=Tx(beta,x);
xs=sort(tx);xsm=sort(-tx);
for i=1:size(rho,2)
    %y=b*etarho(i).*x+beta*sqrt(1-rho(i)^2).*noise;
    %[y,r1,r2]=LMcorr(1,x,alpha(i),noise);
    y=LM(4,x,rho(i),noise); 
    ty=Ty(beta,y);
    %r1 = mycorr(tx,ty);
    r1=corrforlm(tx,ty);
    ys=sort(ty);
    r2=newcorr(xs,xsm,ys,r1);
    %r2 = new(tx,ty,r1);
    Er1(i)=mean(r1);Er2(i)=mean(r2);
end
close all
figure
plot(rho,Er1,'-r');
axis([-1 1 -1 1]);
set(gca,'XTick',-1:0.5:1)
set(gca,'XTickLabel',{'-1','-0.5','0','0.5','1'})
set(gca,'YTick',-1:0.5:1)
set(gca,'YTickLabel',{'-1','-0.5','0','0.5','1'})
hold on 
plot(rho,Er2,'--b');
hold on
plot(rho,rho,'-g');
legend('pearson','new','\rho',4);
title(str2);
xlabel('\rho'),ylabel(['\rho','\xi']);
%saveas(gcf,['NM ',str2,'.jpg']);