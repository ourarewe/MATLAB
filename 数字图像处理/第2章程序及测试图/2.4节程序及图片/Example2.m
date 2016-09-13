% 读入图像并进行数据转换
I=imread('pic6.jpg');
I=rgb2gray(I);
% 添加椒盐噪声
J = imnoise(I,'salt & pepper',0.02);
% 采用不同大小邻域的均值滤波器进行滤波
K1=filter2(fspecial('average',3),J);
K2=filter2(fspecial('average',5),J);
K3=filter2(fspecial('average',7),J);
% 显示结果
subplot(221), imshow(J)
subplot(222),imshow(uint8(K1))
subplot(223),imshow(uint8(K2))
subplot(224),imshow(uint8(K3))
