% Fig.3 Noise robustness comparison of simulation results under LM2

clear;clc;
load sixsignals.mat;

N=100;
rho=-1.0:0.1:1.0;
numrho=size(rho,2);
noise=randn(1000,N);
%r1=zeros(numrho,N);r2=r1;
Er1=zeros(1,numrho);Er2=Er1;
str1='sixsignals.';
str2='St';
x=eval([str1,str2]);
    
for i=1:numrho
    [y,r1,r2]=LMcorr(2,x,rho(i),noise);
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
legend('pearson','new',4);
title(str2);
xlabel('\rho'),ylabel(['\rho','\xi']);
%saveas(gcf,['LM2 ',str2,'.jpg']);
