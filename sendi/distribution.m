close all;clc;clear;

mu=85;
sigma=10;
N=1000;
%x=normrnd(mu,sigma,1,N);
x=-100+200.*rand(1,N);

hist(x,100);

%y=1./(1+exp(-x+85));
y=atan(x-85)./pi+0.5;

figure
hist(y,100)