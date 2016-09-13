% 读入RGB图像并将其转换成灰度图像
I=imread('pic12.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I)
title('原始图像')
% 数据类型转换，MATLAB不支持无符号数学的计算
f=double(I); 
 % 傅里叶变换
k=fft2(f);      
g=fftshift(k);  
[M,N]=size(g);
% 二阶巴特沃思高通滤波器，截止频率为25
nn=2;           
d0=25;
m=fix(M/2);
n=fix(N/2);
 
% 计算传递函数
for i=1:M
    for j=1:N
        d=sqrt((i-m)^2+(j-n)^2);
        if(d==0)
            h=0;
        else
            h=1/(1+0.414*(d0/d)^(2*nn));  
        end
        result(i,j)=h*g(i,j);
    end
end
 
result=ifftshift(result);
J2=ifft2(result);
J3=uint8(real(J2));
subplot(1,2,2);
imshow(J3); 
title('滤波之后的结果')
