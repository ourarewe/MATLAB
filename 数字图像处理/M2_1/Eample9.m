I=imread('hua9.jpg');
I=rgb2gray(I);
%采用最临近插值法进行灰度插值；
X1=imresize(I,10); 
%采用双线性插值法进行灰度插值；
X2=imresize(I,10,'bilinear'); 
%采用三次内插法进行灰度插值；
X3=imresize(I,10,'bicubic'); 
subplot(221),imshow(I,[ ]),title('原始图像');
subplot(222),imshow(X1),title('最邻近插值法');
subplot(223),imshow(X2),title('双线性插值法');
subplot(224),imshow(X3),title('三次内插法');
