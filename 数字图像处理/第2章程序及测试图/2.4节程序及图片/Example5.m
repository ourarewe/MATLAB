%����ԭʼͼ����ӽ�������
I=imread('pic10.jpg');
I=rgb2gray(I);
J=imnoise(I,'salt & pepper',0.04);
%������ֵ�˲�
K=medfilt2(J,[3,3]);
subplot(121), imshow(J)
subplot(122), imshow(K)
