X=imread('pic17.jpg');
 X=rgb2gray(X);
subplot(1,2,1);imshow(X),title('����ͼ��')
%��ͼ����db5С������2��ֽ�
[c,l]=wavedec2(X,2,'db5');
Csize=size(c);
%��������Ҫ�ķֽ�ϵ��
for i=1:Csize(2)
        if(c(i)>300)
           c(i)=1.2*c(i);
        else
           c(i)=0.8*c(i);
        end
    end
%�ع�����ʾͼ��
X1=waverec2(c,l,'db5');
 X1=uint8(X1);
subplot(1,2,2);imshow(X1),title('��ǿ���ͼ��')
