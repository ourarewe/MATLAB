% 可用图：coin.jpg   hua6.jpg 
%        test1.jpg  test2.jpg  test3.jpg  test4.jpg

% 读入图像 'circuit.tif'
I = imread('test4.jpg');
I = rgb2gray(I);
I = im2bw(I);
% 进行边缘检测
BW1 = edge(I);
% 显示结果
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(BW1);
