I=imread('4.jpg');
varargin=I;
ori=varargin{1};
[m,n]=size(ori(:,:,1));
iii=size(varargin{1});
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
