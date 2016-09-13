function X=row(varargin)
%功能：对多波段进行预处理
ori=varargin{1};
ori

[m,n]=size(ori(:,:,1));
m
n

iii=size(varargin{1});
iii

band=iii(3);
if band==1
   error('打开文件出错');
else
   X=zeros(band,m*n);
   for i=1:band
       a=ori(:,:,i);
       a=a';
       a=a(:)';
       for j=1:m*n
           X(i,j)=a(1,j);
       end
     end
   end
X;
