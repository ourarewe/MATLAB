function [c]=autocorcoeficient(A,shiftx,shifty)
% 功能：计算数字图像的自相关函数
% 输入：A-二维灰度图像矩阵
%       shiftx,shifty-偏移量；
 %输出：c-二维灰度图像的自相关函数；
[M,N]=size(A);
B=zeros(M+abs(shiftx),N+abs(shifty));
A=double(A);
B=double(B);
%偏移量处理，超过图像范围之外的像素值为0
if(shiftx>0)&&(shifty>0)
B(1:M,1:N)=A;
end
if(shiftx>0)&&(shifty<0)
B(1:M,abs(shifty)+1:abs(shifty)+N)=A;
end
if(shiftx<0)&&(shifty>0)
B(abs(shiftx)+1:abs(shiftx)+M,1:N)=A;
end
if(shiftx<0)&&(shifty<0)
B(abs(shiftx)+1:abs(shiftx)+M,abs(shifty)+1:abs(shifty)+N)=A;
end
%计算自相关系数
sum1=0;
sum2=0;
for i=1:M
    for j=1:N
        sum1=sum1+A(i,j)*B(i,j);
        sum2=sum2+A(i,j)*A(i,j);
    end
end
c=sum1/sum2;
