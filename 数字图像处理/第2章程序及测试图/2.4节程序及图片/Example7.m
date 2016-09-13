I=imread('pic10.jpg');
I=rgb2gray(I);
% 叠加椒盐噪声
I2=imnoise(I,'salt & pepper',0.05);
subplot(1,2,1);imshow(I2);title('噪声图像');
% 数据类型转换，MATLAB不支持图像的无符号整型的计算
f=double(I2);
% 傅里叶变换
k=fft2(f);
g=fftshift(k);
[N1,N2]=size(g);
% 构造指数低通滤波器进行滤波
n=2;
d0=25;
u0=round(N1/2);
v0=round(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d/d0)^n);
        y(i,j)=h*g(i,j);
    end
end 
y=ifftshift(y);
E1=ifft2(y);
E2=uint8(real(E1));
% 显示滤波处理后的图像
 subplot(1,2,2);imshow(E2);title('滤波后的图像');
