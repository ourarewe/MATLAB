% ����RGBͼ�񣬲�ת���ɻҶ�ͼ��
I=imread('pic2.jpg');
I=rgb2gray(I);

% ��Ҷ�ͼ�������������
[M,N]=size(I);

% ����ɢ���Ҿ���
P=dctmtx(M);
Q=dctmtx(N);

% ת���������ͣ��Ա���о�������
I1=double(I);

% ������ɢ����Ҷ�任
Idct=P*I1*Q';

% ��ʾԭʼͼ����任���
subplot(121),imshow(I),title('ԭʼͼ��');
subplot(122),imshow(Idct),title('��ɢ���ұ任���ͼ��');
