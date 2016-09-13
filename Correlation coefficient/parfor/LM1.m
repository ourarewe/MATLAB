% Fig.2 Noise robustness comparison of simulation results under LM1
%command:LM1(str)
%function LM1()
tic
clear;clc;
load sixsignals.mat;

N=100;
alpha=0:0.1:1;
numalpha=size(alpha,2);
noise=randn(1000,N);
%r1=zeros(1,N);r2=r1;
Er1=zeros(1,numalpha);Er2=Er1;
SDr1=Er1;SDr2=SDr1;
str1='sixsignals.';
str2='St';
x=eval([str1,str2]);
xs=sort(x);xsm=sort(-x);
    
for i=1:numalpha
    [y,r1,r2]=LMcorr(1,x,alpha(i),noise);%N=10000:17.056756
    %y=LM(1,x,alpha(i),noise);               %N=10000:19.284354
    %r1=corrforlm(x,y);
    %ys=sort(y);
    %r2=newcorr(xs,xsm,ys,r1);
    
    Er1(i)=mean(r1);Er2(i)=mean(r2);
    SDr1(i)=std(r1);SDr2(i)=std(r2);
    
end

close all
figure

plot(alpha,Er1,'-rd');
set(gca,'XTick',0:0.5:1)
set(gca,'XTickLabel',{'0','0.5','1'})
set(gca,'YTick',0.2:0.2:1)
set(gca,'YTickLabel',{'0.2','0.4','0.6','0.8','1'})
hold on

plot(alpha,Er2,'-.b>');
legend(['\rho','P'],['\rho','N'],3);legend boxoff;
hold on
axis([-inf,inf,0.2 1]);
set(gca,'XTickLabel',0:0.5:1);
set(gca,'YTickLabel',0.2:0.2:1);
title(str2);
xlabel('\alpha'),ylabel('Mean ¡À 3 ¡Á SD');

errorbar(alpha,Er1(:),SDr1(:),'r','linestyle', 'none');
errorbar(alpha,Er2(:),SDr2(:),'b','linestyle', 'none');
%saveas(gcf,['LM1 ',str2,'.jpg']);[Er1,Er2]
toc