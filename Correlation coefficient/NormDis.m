%two-dimensional Normal Distribution
%
% (C)2008 TangSheng
%
function NormDis(u1,u2,sig1,sig2,rho)
%fault
if nargin<5, rho = 0; end                   %���ϵ��
if nargin<4, sig2 = 2;end                   %��̬�ֲ�2����
if nargin<3, sig1 = 1;end                   %��̬�ֲ�1����
if nargin<2, u2 = 2;end                     %��̬�ֲ�2��ֵ
if nargin<1, u1 = 6;end                     %��̬�ֲ�1��ֵ
 
%global ava;
ava = [u1,u2];                                %��˹�ֲ���ֵ����
 
cov_xy = rho*sig1*sig2;                       %Э����
 
%global sigma;
sigma = [sig1 cov_xy ;cov_xy sig2 ];          %Э�������
 
%------������ʾ����Χ------------%
 
scop1_l = u1-sqrt(sig1)-2;
scop1_r = u1+sqrt(sig1)+2;
scop2_l = u2-sqrt(sig2)-2;
scop2_r = u2+sqrt(sig2)+2;
[X,Y] = meshgrid(scop1_l:0.2:scop1_r,scop2_l:0.2:scop2_r);
xy = [X(:) Y(:)];
p = mvnpdf(xy,ava,sigma);                     %���ϸ����ܶ�
P = reshape(p,size(X));
 
mesh(X,Y,P);                                  %3-D�����ܶ�ͼ��
name1 = ['��ά��̬�ֲ� N(',num2str(u1),',',num2str(u2)];
name2 = [',',num2str(sig1),',',num2str(sig2),',',num2str(rho),')'];
name = [name1,name2];
title(name);
end
