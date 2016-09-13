clear
%读入原始图像，添加椒盐噪声，并显示
A=imread('pic8.jpg');
A=imnoise(A,'salt & pepper',0.04);
subplot(1,2,1)
imshow(A)
title('添加噪声后的图像')

%转换图像类型
A=rgb2gray(A);
image=double(A);
[m,n]=size(A);
%进行中值滤波并将滤波后的结果显示
u=zeros(1,9);
for i=2:m-1,
   for j=2:n-1,
      u(1)=image(i,j);u(2)=image(i,j+1);u(3)=image(i-1,j+1);
      u(4)=image(i-1,j);u(5)=image(i-1,j-1);u(6)=image(i,j-1);
      u(7)=image(i+1,j-1);u(8)=image(i+1,j);u(9)=image(i+1,j+1);
      for p=1:8,
           for q=1:8-p,
              if u(q)>u(q+1)
                  k=u(q);u(q)=u(q+1);u(q+1)=k;
              end,
          end,
      end,
      rimage(i,j)=u(5);
   end,
end, 
subplot(1,2,2)
rimage=uint8(rimage);
imshow(rimage)
title('中值滤波后的图像')
