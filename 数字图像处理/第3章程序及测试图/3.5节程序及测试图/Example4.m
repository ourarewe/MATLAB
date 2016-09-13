clear;

for i=1:5
    %将i从整型变量变为字符型
    k=int2str(i);
    %形成’boardk.jpg’的文件
    k1=strcat('board',k,'.jpg');
    %读入图像并存储，i用来表征存储的帧数
    B(i,:,:)=imread(k1);
    % 添加椒盐噪声
    B(i,:,:)=imnoise(B(i,:,:),'salt & pepper',0.05); 
    subplot(3,3,i),C(:,:)=B(i,:,:);imshow(C);
end

%进行帧间平均滤波，并显示
figure
for i=1:4
    D(:,:,i)=double(B(i,:,:)+B(i+1,:,:))/2;
   subplot(2,2,i)
    imshow(uint8(D(:,:,i)))
end
