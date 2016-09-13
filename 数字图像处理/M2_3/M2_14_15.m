I=imread('pic1.jpg');
I=rgb2gray(I);
y=rdct2(I);
x=irdct2(y);
subplot(1,3,1),imshow(I),title('原始图像')
subplot(1,3,2),imshow(uint8(y)),title('二维余弦变换结果')
subplot(1,3,3),imshow(uint8(x)),title('二维余弦逆变换结果')