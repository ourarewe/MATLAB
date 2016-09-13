clear;

%读入视频序列的1～9帧图像，并显示
for i=1:9
    %将i从整型变量变为字符型
    k=int2str(i);
    %形成’boardk.jpg’的文件
    k1=strcat('board',k,'.jpg');
    %读入图像并存储，i用来表征存储的帧数
    B(i,:,:)=imread(k1);
    subplot(3,3,i),C(:,:)=B(i,:,:);imshow(C);
end
%绘制每帧图像的灰度直方图
    figure
    for i=1:9
        subplot(3,3,i),D(:,:)=B(i,:,:);
        imhist(D);
    end
