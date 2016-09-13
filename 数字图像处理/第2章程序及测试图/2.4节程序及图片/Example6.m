I=imread('pic8.jpg');
I=rgb2gray(I);
% 叠加椒盐噪声
J1=imnoise(I,'salt & pepper');  
subplot(1,2,1)
imshow(J1),title('原始图像')
% 数据类型转换，MATLAB不支持图像的无符号整型的计算
f=double(J1);    
% 傅里叶变换
g=fft2(f);        
g=fftshift(g);     
[M,N]=size(g);
% 二阶巴特沃斯(Butterworth)低通滤波器
nn=2;           
d0=25;
m=fix(M/2); n=fix(N/2);
% 计算低通滤波器传递函数
for i=1:M
       for j=1:N
           d=sqrt((i-m)^2+(j-n)^2);
           h=1/(1+0.414*(d/d0)^(2*nn));  
           result(i,j)=h*g(i,j);
       end
end
result=ifftshift(result);
J2=ifft2(result);
J3=uint8(real(J2));
% 显示滤波处理后的图像
subplot(1,2,2)     
imshow(J3),title('滤波处理后的图像')
