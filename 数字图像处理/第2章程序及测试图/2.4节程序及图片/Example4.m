clear
%����ԭʼͼ����ӽ�������������ʾ
A=imread('pic8.jpg');
A=imnoise(A,'salt & pepper',0.04);
subplot(1,2,1)
imshow(A)
title('����������ͼ��')

%ת��ͼ������
A=rgb2gray(A);
image=double(A);
[m,n]=size(A);
%������ֵ�˲������˲���Ľ����ʾ
u=zeros(1,9);
for i=2:m-1,
   for j=2:n-1,
      u(1)=image(i,j);u(2)=image(i,j+1);u(3)=image(i-1,j+1);
      u(4)=image(i-1,j);u(5)=image(i-1,j-1);u(6)=image(i,j-1);
      u(7)=image(i+1,j-1);u(8)=image(i+1,j);u(9)=image(i+1,j+1);
      for p=1:8,
           for q=1:8-p,
              if u(q)>u(q+1)
                  k=u(q);u(q)=u(q+1);u(q+1)=k;
              end,
          end,
      end,
      rimage(i,j)=u(5);
   end,
end, 
subplot(1,2,2)
rimage=uint8(rimage);
imshow(rimage)
title('��ֵ�˲����ͼ��')
