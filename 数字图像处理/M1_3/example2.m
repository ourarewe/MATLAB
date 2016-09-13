% 读入图像并显示
I=imread('study.jpg');
I=rgb2gray(I);
imshow(I)

% 获得图像的行列数，并存入矩阵s中，s(1,1)是图像矩阵的行数，s(1,2)为图像矩阵的列数
s=size(I);
% 转化成双精度型，才能进行代数运算
I=double(I); 

%用该图像内2×2块的平均像素代替2×2块内的所有像素
for i=1:2:s(1,1)
  for j=1:2:s(1,2)
     sum=I(i,j)+I(i+1,j)+I(i,j+1)+I(i+1,j+1);
     I(i,j)=sum/4;
     I(i+1,j)=sum/4;
     I(i,j+1)=sum/4;
     I(i+1,j+1)=sum/4;
  end
end

%将数组I转换为8位无符号整型，用于图像显示
I=uint8(I);
figure
imshow(I)
