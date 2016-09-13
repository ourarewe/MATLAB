RGB=imread('pic16.jpg');
HSV=rgb2hsv(RGB);
subplot(121)
% subimage(RGB);
imshow(RGB)
title('RGB空间图像');
subplot(122)
% subimage(HSV);
imshow(HSV)
title('变换后的HSV空间图像');
