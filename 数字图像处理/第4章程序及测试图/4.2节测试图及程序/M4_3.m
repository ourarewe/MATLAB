% ����ͼ��coin.jpg   hua6.jpg 
%        test1.jpg  test2.jpg  test3.jpg  test4.jpg

% ����ͼ�� 'circuit.tif'
I = imread('test4.jpg');
I = rgb2gray(I);
I = im2bw(I);
% ���б�Ե���
BW1 = edge(I);
% ��ʾ���
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(BW1);
