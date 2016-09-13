clear;clc;
%tic
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
x=sixsignals.St;
tx=Tx(beta,x);
xs=sort(tx);xsm=sort(-tx);
    %y=b*etarho(i).*x+beta*sqrt(1-rho(i)^2).*noise;
    %[y,r1,r2]=LMcorr(1,x,alpha(i),noise);
    y=LM(4,x,-1,noise); 
    ty=Ty(beta,y);
    %r1 = mycorr(tx,ty);
    r1=corrforlm(tx,ty);
    ys=sort(ty);
    r2=newcorr(xs,xsm,ys,r1);
    %r2 = new(tx,ty,r1);



%toc