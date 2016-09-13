%读入原始图像，添加椒盐噪声
I=imread('pic10.jpg');
I=rgb2gray(I);
J=imnoise(I,'salt & pepper',0.04);
%进行中值滤波
K=medfilt2(J,[3,3]);
subplot(121), imshow(J)
subplot(122), imshow(K)
