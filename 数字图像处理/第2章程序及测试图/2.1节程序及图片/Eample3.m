I=imread('hua3.jpg');
I=rgb2gray(I);
X1=imresize(I,2);%�Ŵ�Ϊԭ����2��
X2=imresize(I,0.5);%��СΪԭ����1/2
figure,imshow(X1);
figure,imshow(X2);