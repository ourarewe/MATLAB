function y=rdct2(x,n,m) 
% ���ܣ�ʵ�ֶ�ά��ɢ���ұ任
% ���룺x-���任�ĻҶ�ͼ��
%       m,n-���任�������С��Ĭ��ֵΪ[m,n]=size(x)

 [dimx,dimy] = size(x);
if nargin<2
    n = dimx;
    m = dimy;
end
y = zeros(n,m);
for ii=1:n
    y(ii,:) = rdct(x(ii,:),m);
end
for ii=1:m
    y(:,ii) = rdct(y(:,ii),n);
end
