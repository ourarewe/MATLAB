% 读入RGB图像，并转换成灰度图像
I=imread('pic3.jpg');
I=rgb2gray(I);
D1=I;
% 进行离散余弦变换
D2=dct2(D1);
% 取余弦变换后矩阵左上角不同尺寸的小区域组成新的矩阵
s=size(D1);
P=zeros(s);
P1=P;
P2=P;
P3=P;
P1(1:40,1:40)=D2(1:40,1:40);
P2(1:60,1:60)=D2(1:60,1:60);
P3(1:80,1:80)=D2(1:80,1:80);
% 将余弦变换后的矩阵和各小区域矩阵进行离散余弦逆变换
D3=idct2(D2);
E1=idct2(P1);
E2=idct2(P2);
E3=idct2(P3);
% 显示原始图像及变换后的结果
subplot(2,3,1),imshow(D1); subplot(2,3,2), imshow(D2); subplot(2,3,3),image(D3);
subplot(2,3,4),image(E1); subplot(2,3,5), image(E2); subplot(2,3,6);image(E3)
