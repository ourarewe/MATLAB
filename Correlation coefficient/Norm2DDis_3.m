function [x,y]=Norm2DDis_2(u1,u2,sig1,sig2,rho,n)
%��mvnrnd������ά��˹���������������
%fault
if nargin<6, n = 1000;end
if nargin<5, rho = 0; end                   %���ϵ��
if nargin<4, sig2 = 1;end                   %��̬�ֲ�1����
if nargin<3, sig1 = 1;end                   %��̬�ֲ�1����
if nargin<2, u2 = 0;end                     %��̬�ֲ�0��ֵ
if nargin<1, u1 = 0;end                     %��̬�ֲ�0��ֵ

mu = [u1 u2];
sigma = [sig1^2 rho*sig1*sig2;rho*sig1*sig2 sig2^2];
R=mvnrnd(mu,sigma,n);
x=R(:,1);
y=R(:,2);