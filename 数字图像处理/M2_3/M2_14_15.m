I=imread('pic1.jpg');
I=rgb2gray(I);
y=rdct2(I);
x=irdct2(y);
subplot(1,3,1),imshow(I),title('ԭʼͼ��')
subplot(1,3,2),imshow(uint8(y)),title('��ά���ұ任���')
subplot(1,3,3),imshow(uint8(x)),title('��ά������任���')