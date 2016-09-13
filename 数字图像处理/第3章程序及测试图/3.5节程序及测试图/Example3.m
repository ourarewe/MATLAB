%读入视频序列的1～9帧图像，并显示
for i=1:9
     %将i从整型变量变为字符型
    k=int2str(i);
    %形成’ballk.jpg’的文件
    k1=strcat('ball',k,'.jpg');
     %读入图像并存储，i用来表征存储的帧数
    B(i,:,:,:)=imread(k1);
    subplot(3,3,i),C(:,:,:)=B(i,:,:,:);imshow(C);
end
    figure
 %相邻帧之间图像做差
for i=1:8
        subplot(3,3,i),D(:,:,:)=B(i+1,:,:,:)-B(i,:,:,:);
        imshow(D);
    end
