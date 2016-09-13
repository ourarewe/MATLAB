%创建结构元素
SE=strel('rectangle',[40 30]);
I=imread('eight.tif');
subplot(131),imshow(I),title('原始图像');
%使用结构元素腐蚀图像
I2=imerode(I,SE);
subplot(132),imshow(I2), title('腐蚀图像');
%恢复矩形为原有大小，使用相同的结构元素对腐蚀过的图像进行膨胀
I3=imdilate(I2,SE);
subplot(133),imshow(I3), title('膨胀图像');
