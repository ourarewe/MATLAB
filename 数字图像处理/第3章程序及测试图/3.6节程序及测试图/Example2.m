%����һ��BMPͼ�񣬲���ʾ
I=imread('bingmayong.bmp');
subplot(1,2,1);subimage(I);
title('BMPͼ��');
 
%��BMPͼ��ת��ΪJPGͼ�񣬲���ʾ
imwrite(I,'bingmayong.jpg','jpg');
J=imread('bingmayong.jpg');
subplot(1,2,2);subimage(J);
title('JPEGѹ�����ͼ��');
 
%����JPEG������ѹ��������BMPͼ���JPGͼ��֮���PSNR
PSNR(I,J);
