% ����ͼ�񲢽�������ת��
I=imread('pic6.jpg');
I=rgb2gray(I);
% ��ӽ�������
J = imnoise(I,'salt & pepper',0.02);
% ���ò�ͬ��С����ľ�ֵ�˲��������˲�
K1=filter2(fspecial('average',3),J);
K2=filter2(fspecial('average',5),J);
K3=filter2(fspecial('average',7),J);
% ��ʾ���
subplot(221), imshow(J)
subplot(222),imshow(uint8(K1))
subplot(223),imshow(uint8(K2))
subplot(224),imshow(uint8(K3))
