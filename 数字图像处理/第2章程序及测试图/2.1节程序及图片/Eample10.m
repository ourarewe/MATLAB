% ����ͼ��
I=imread('hua10.jpg');
% ����ɫͼ��ת���ɻҶ�ͼ��
I=rgb2gray(I);
% ��Ҷ�ͼ����С�������
[m,n]=size(I);
% ���ɻ���ģ�棻
C=[-1 -1 -1
     -1 8 -1
     -1 -1 -1];
% ת����˫�������Խ��о������㣻
I=double(I);
% ���л������������
for i=2:m-1
    for j=2:n-1
      L=I(i-1:i+1,j-1:j+1).*C;
      A(i,j)=sum(sum(L));
    end
end
% ��ʾͼ��
subplot(121),imshow(uint8(I)),title('ԭʼͼ��');
subplot(122),imshow(uint8(A)),title('��������������ͼ��');
