I=imread('hua7.jpg');
I=rgb2gray(I);
[r,c]=size(I);
for i=1:r
    for j=1:c
        B(i,2*j)=I(i,j);
        B(i,2*j-1)=I(i,j);
    end
end
 
for i=1:r
    for j=1:2*c
        C(2*i,j)=B(i,j);
        C(2*i-1,j)=B(i,j);
    end
end
subplot(121);imshow(I);title('原始图像');
subplot(122);imshow(C);title('最邻近插值后的图像');
