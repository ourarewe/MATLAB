I=imread('hua5.jpg');
I=rgb2gray(I);
subplot(141),imshow(I),title('原始图像');
X1=imrotate(I,30,'nearest');%旋转30°
subplot(142),imshow(uint8(X1)); title('旋转30度');
X2=imrotate(I,-45,'nearest');% 旋转-45°
subplot(143),imshow(uint8(X2)); title('旋转-45度');
X3=imrotate(I,60,'nearest');% 旋转60°
subplot(144),imshow(uint8(X3)); title('旋转60度');
