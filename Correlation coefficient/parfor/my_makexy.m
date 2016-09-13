function [X,Y]=my_makexy(rownum, colnum, rho, sx,sy)
%rownum���г��ȣ�colnum��XY�ԣ��飩��
if nargin < 4, sx=1; sy=1;end
sigma=[sx^2 sx*sy*rho; sx*sy*rho sy^2];

X=zeros(rownum,colnum);
Y=X;
for j=1:colnum
    z=mvnrnd([0 0], sigma, rownum);
    X(:,j)=z(:,1);
    Y(:,j)=z(:,2);
end