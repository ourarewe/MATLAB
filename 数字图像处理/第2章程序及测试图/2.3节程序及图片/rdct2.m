function y=rdct2(x,n,m) 
% 功能：实现二维离散余弦变换
% 输入：x-待变换的灰度图像
%       m,n-待变换的区域大小，默认值为[m,n]=size(x)

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
