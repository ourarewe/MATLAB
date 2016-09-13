function y=irdct2(x,n,m)
% 功能：实现二维离散逆余弦变换
% 输入：x-待变换的图像
%       m,n-待变换的区域大小，默认值为[m,n]=size(x)

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

