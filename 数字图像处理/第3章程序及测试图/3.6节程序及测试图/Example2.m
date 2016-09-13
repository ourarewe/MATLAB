%读入一个BMP图像，并显示
I=imread('bingmayong.bmp');
subplot(1,2,1);subimage(I);
title('BMP图像');
 
%将BMP图像转换为JPG图像，并显示
imwrite(I,'bingmayong.jpg','jpg');
J=imread('bingmayong.jpg');
subplot(1,2,2);subimage(J);
title('JPEG压缩后的图像');
 
%由于JPEG是有损压缩，计算BMP图像和JPG图像之间的PSNR
PSNR(I,J);
