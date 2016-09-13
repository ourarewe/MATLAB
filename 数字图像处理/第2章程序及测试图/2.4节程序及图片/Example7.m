I=imread('pic10.jpg');
I=rgb2gray(I);
% ���ӽ�������
I2=imnoise(I,'salt & pepper',0.05);
subplot(1,2,1);imshow(I2);title('����ͼ��');
% ��������ת����MATLAB��֧��ͼ����޷������͵ļ���
f=double(I2);
% ����Ҷ�任
k=fft2(f);
g=fftshift(k);
[N1,N2]=size(g);
% ����ָ����ͨ�˲��������˲�
n=2;
d0=25;
u0=round(N1/2);
v0=round(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d/d0)^n);
        y(i,j)=h*g(i,j);
    end
end 
y=ifftshift(y);
E1=ifft2(y);
E2=uint8(real(E1));
% ��ʾ�˲�������ͼ��
 subplot(1,2,2);imshow(E2);title('�˲����ͼ��');
