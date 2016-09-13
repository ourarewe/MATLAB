% 构造加权平均滤波模板
H=[1 2 1
   2 4 2
   1 2 1];
H1=1/16*H;
% 读入图像，并添加椒盐噪声
I=imread('pic7.jpg');
I1= imnoise(I,'salt & pepper',0.02);
% 进行滤波
J=imfilter(I1,H1);
% 显示处理结果
subplot(121),imshow(I1)
subplot(122),imshow(J)
