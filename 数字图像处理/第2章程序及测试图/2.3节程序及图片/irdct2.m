function y=irdct2(x,n,m)
% ���ܣ�ʵ�ֶ�ά��ɢ�����ұ任
% ���룺x-���任��ͼ��
%       m,n-���任�������С��Ĭ��ֵΪ[m,n]=size(x)

 [dimx,dimy] = size(x);
if nargin<2
    n = dimx;
    m = dimy;
end
y = zeros(n,m);
for ii=1:n
    y(ii,:) = irdct(x(ii,:),m);
end
for ii=1:m
    y(:,ii) = irdct(y(:,ii),n);
end

