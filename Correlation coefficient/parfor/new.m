% X为列向量,Y为矩阵,r为横向量
function R = new(x,y,r)
if nargin<3,r=corr(x,y);end
%r=r';%若r为列向量则转为横向量
n=size(y,1);
N=size(y,2);

sx=sort(x);

over0=r>=0; under0=r<0;

over0=repmat(over0,n,1);
under0=repmat(under0,n,1);
x1(under0)=-y(under0);
x1(over0)=y(over0);
x1=reshape(x1,n,N);
sy=sort(x1);

R=r./corr(sx,sy);
