%�����ṹԪ��
SE=strel('rectangle',[40 30]);
I=imread('eight.tif');
subplot(131),imshow(I),title('ԭʼͼ��');
%ʹ�ýṹԪ�ظ�ʴͼ��
I2=imerode(I,SE);
subplot(132),imshow(I2), title('��ʴͼ��');
%�ָ�����Ϊԭ�д�С��ʹ����ͬ�ĽṹԪ�ضԸ�ʴ����ͼ���������
I3=imdilate(I2,SE);
subplot(133),imshow(I3), title('����ͼ��');
