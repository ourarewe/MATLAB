%霍夫变换程序
%读入一幅真彩图像，将其放入一个名为RGB的数组；
RGB = imread('pic12.jpg'); 
figure
imshow(RGB)
% 将读入的真彩图像转换为灰度图像，将该灰度图像放在一个名为I的矩阵中；
I= rgb2gray(RGB); 
% 采用canny算子对图像进行边缘检测；
BW = edge(I,'canny'); 
%对存储于BW数组中的二值图像进行霍夫变换，将霍夫变换后的结果 放在一个名为H   
%的矩阵中，该矩阵中含有size(T)*size(R)个累加器，向量T中是Theta轴的值，R 是RHO 
%的值。霍夫变换空间内的RHO轴和 THETA轴的最小单位为0.75；
[H,T,R] = hough(BW,'RhoResolution',0.75,'ThetaResolution',0.75); 
imshow(imadjust(mat2gray(H)),'XData',T,'YData',R,...
      'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;                        
colormap(hot); 
%显示峰值累加器的位置（取累加器中数值最大的4个）
P  = houghpeaks(H,4)  
% P（:,2）表示P所有行的第二列元素；
x = T(P(:,2)); y = R(P(:,1)); 
% 将峰值点在霍夫空间画出。
plot(x,y,'s','color','white');   
