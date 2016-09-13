clear all;
bw0=imread('eight.tif');
subplot(231),imshow(bw0),title('原始图像');
%变为阈值取为0.7的二值图像
bw1=im2bw(bw0,0.7);
subplot(232),imshow(bw1),title('二值图像');
%用三阶单位矩阵的结构元素进行开远算
s=ones(3);
bw2=imopen(bw1,s);
subplot(233),imshow(bw2),title('用三阶单位矩阵元素进行开运算');
%用三阶单位矩阵的结构元素进行闭运算
bw3=imclose(bw1,s);
subplot(234),imshow(bw3),title('用三阶单位矩阵元素进行闭运算');
%用平坦圆盘结构元素进行开运算
s1=strel('disk',2);
bw4=imopen(bw1,s1);
subplot(235),imshow(bw4),title('用圆盘结构元素进行开运算');
%用平坦圆盘结构元素进行闭运算
bw5=imclose(bw1,s1);
subplot(236),imshow(bw5),title('用圆盘结构元素进行闭运算');
