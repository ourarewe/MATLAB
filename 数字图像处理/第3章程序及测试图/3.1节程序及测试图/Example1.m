RGB=imread('pic16.jpg');
HSV=rgb2hsv(RGB);
subplot(121)
% subimage(RGB);
imshow(RGB)
title('RGB�ռ�ͼ��');
subplot(122)
% subimage(HSV);
imshow(HSV)
title('�任���HSV�ռ�ͼ��');
