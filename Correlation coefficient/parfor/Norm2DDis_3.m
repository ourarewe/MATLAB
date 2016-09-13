function [x,y]=Norm2DDis_2(u1,u2,sig1,sig2,rho,n)
%用mvnrnd产生二维高斯随机变量，列向量
%fault
if nargin<6, n = 1000;end
if nargin<5, rho = 0; end                   %相关系数
if nargin<4, sig2 = 1;end                   %正态分布1方差
if nargin<3, sig1 = 1;end                   %正态分布1方差
if nargin<2, u2 = 0;end                     %正态分布0均值
if nargin<1, u1 = 0;end                     %正态分布0均值

mu = [u1 u2];
sigma = [sig1^2 rho*sig1*sig2;rho*sig1*sig2 sig2^2];
R=mvnrnd(mu,sigma,n);
x=R(:,1);
y=R(:,2);