% �����Ȩƽ���˲�ģ��
H=[1 2 1
   2 4 2
   1 2 1];
H1=1/16*H;
% ����ͼ�񣬲���ӽ�������
I=imread('pic7.jpg');
I1= imnoise(I,'salt & pepper',0.02);
% �����˲�
J=imfilter(I1,H1);
% ��ʾ������
subplot(121),imshow(I1)
subplot(122),imshow(J)
