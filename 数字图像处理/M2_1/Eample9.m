I=imread('hua9.jpg');
I=rgb2gray(I);
%�������ٽ���ֵ�����лҶȲ�ֵ��
X1=imresize(I,10); 
%����˫���Բ�ֵ�����лҶȲ�ֵ��
X2=imresize(I,10,'bilinear'); 
%���������ڲ巨���лҶȲ�ֵ��
X3=imresize(I,10,'bicubic'); 
subplot(221),imshow(I,[ ]),title('ԭʼͼ��');
subplot(222),imshow(X1),title('���ڽ���ֵ��');
subplot(223),imshow(X2),title('˫���Բ�ֵ��');
subplot(224),imshow(X3),title('�����ڲ巨');
