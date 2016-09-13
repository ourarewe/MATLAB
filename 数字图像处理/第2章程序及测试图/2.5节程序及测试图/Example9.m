X=imread('pic17.jpg');
 X=rgb2gray(X);
subplot(1,2,1);imshow(X),title('输入图像')
%对图像用db5小波进行2层分解
[c,l]=wavedec2(X,2,'db5');
Csize=size(c);
%弱化不重要的分解系数
for i=1:Csize(2)
        if(c(i)>300)
           c(i)=1.2*c(i);
        else
           c(i)=0.8*c(i);
        end
    end
%重构并显示图像
X1=waverec2(c,l,'db5');
 X1=uint8(X1);
subplot(1,2,2);imshow(X1),title('增强后的图像')
