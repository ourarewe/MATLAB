% ����RGBͼ�񣬲�ת���ɻҶ�ͼ��
I=imread('pic3.jpg');
I=rgb2gray(I);
D1=I;
% ������ɢ���ұ任
D2=dct2(D1);
% ȡ���ұ任��������Ͻǲ�ͬ�ߴ��С��������µľ���
s=size(D1);
P=zeros(s);
P1=P;
P2=P;
P3=P;
P1(1:40,1:40)=D2(1:40,1:40);
P2(1:60,1:60)=D2(1:60,1:60);
P3(1:80,1:80)=D2(1:80,1:80);
% �����ұ任��ľ���͸�С������������ɢ������任
D3=idct2(D2);
E1=idct2(P1);
E2=idct2(P2);
E3=idct2(P3);
% ��ʾԭʼͼ�񼰱任��Ľ��
subplot(2,3,1),imshow(D1); subplot(2,3,2), imshow(D2); subplot(2,3,3),image(D3);
subplot(2,3,4),image(E1); subplot(2,3,5), image(E2); subplot(2,3,6);image(E3)
