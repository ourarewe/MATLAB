I=imread('hua5.jpg');
I=rgb2gray(I);
subplot(141),imshow(I),title('ԭʼͼ��');
X1=imrotate(I,30,'nearest');%��ת30��
subplot(142),imshow(uint8(X1)); title('��ת30��');
X2=imrotate(I,-45,'nearest');% ��ת-45��
subplot(143),imshow(uint8(X2)); title('��ת-45��');
X3=imrotate(I,60,'nearest');% ��ת60��
subplot(144),imshow(uint8(X3)); title('��ת60��');
