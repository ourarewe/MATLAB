% ����ͼ�񣬲�����ת���ɻҶ�ͼ��
I=imread('pic13.jpg');
I=rgb2gray(I); 
subplot(1,2,1);
imshow(I),title('ԭʼͼ��');
% ��������ת����MATLAB��֧���޷������͵���ѧ����
f=double(I);
% ���и���Ҷ�任
k=fft2(f);      
g=fftshift(k);  
[N1,N2]=size(g);
% ����һ�׽�ֹƵ��Ϊ5��ָ����ͨ�˲���
n=1;             
d0=5;           
u0=round(N1/2);
v0=round(N2/2);
for i=1:N1
    for j=1:N2
        d=sqrt((i-u0)^2+(j-v0)^2);
        h=exp(-(d0/d)^n);
        y(i,j)=h*g(i,j);
    end
end
    % ���и���Ҷ��任
y=ifftshift(y);
E1=ifft2(y);
% ��ʾ������
E2=uint8(real(E1));
subplot(1,2,2);
imshow(E2),title('�˲���Ľ��');
