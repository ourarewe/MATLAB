% 读入图像，并将其转换成灰度图像
I=imread('pic13.jpg');
I=rgb2gray(I); 
subplot(1,2,1);
imshow(I),title('原始图像');
% 数据类型转换，MATLAB不支持无符号整型的数学计算
f=double(I);
% 进行傅里叶变换
k=fft2(f);      
g=fftshift(k);  
[N1,N2]=size(g);
% 构造一阶截止频率为5的指数高通滤波器
n=1;             
d0=5;           
u0=round(N1/2);
v0=round(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d0/d)^n);
        y(i,j)=h*g(i,j);
    end
end
    % 进行傅里叶逆变换
y=ifftshift(y);
E1=ifft2(y);
% 显示处理结果
E2=uint8(real(E1));
subplot(1,2,2);
imshow(E2),title('滤波后的结果');
