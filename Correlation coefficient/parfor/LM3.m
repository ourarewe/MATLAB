% Fig.4 Noise robustness comparison of simulation results under LM1
clear;clc;
load sixsignals.mat;

N=10;
delta=30;
alpha=1;
tau=-100:1:100;
str1='sixsignals.';
str2='Se';
S=eval([str1,str2]);
noise=randn(1000-delta,N);

SX=S(1:end-delta);
SY=S(1+delta:end)+alpha.*noise(:,1);
[r1,r2]=LM3a(SX,SY,tau);
LM3plota(r1,r2,tau); 
taub=28:32;
LM3b(S,N,noise,delta,taub);

