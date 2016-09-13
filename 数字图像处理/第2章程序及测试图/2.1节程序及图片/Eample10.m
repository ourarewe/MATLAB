% 读入图像；
I=imread('hua10.jpg');
% 将彩色图像转换成灰度图像；
I=rgb2gray(I);
% 求灰度图像的行、列数；
[m,n]=size(I);
% 生成滑块模版；
C=[-1 -1 -1
     -1 8 -1
     -1 -1 -1];
% 转换成双精度型以进行矩阵运算；
I=double(I);
% 进行滑块邻域操作；
for i=2:m-1
    for j=2:n-1
      L=I(i-1:i+1,j-1:j+1).*C;
      A(i,j)=sum(sum(L));
    end
end
% 显示图像；
subplot(121),imshow(uint8(I)),title('原始图像');
subplot(122),imshow(uint8(A)),title('滑动邻域操作后的图像');
