%  pic16.jpg    pic17.jpg    pic18.jpg

a=imread('pic16.jpg');
a=rgb2gray(a);
subplot(121);imshow(a);title('�Ҷ�ͼ��');
c=zeros(size(a));
pos=find(a<85);
c(pos)=a(pos);
b(:,:,3)=c;
c=zeros(size(a));
pos=find((a>=85)&(a<170));
c(pos)=a(pos);
b(:,:,2)=c;
c=zeros(size(a));
pos=find(a>=170);
c(pos)=a(pos);
b(:,:,1)=c;
b=uint8(b);
subplot(122);imshow(b);title('α����ǿ��ͼ��');