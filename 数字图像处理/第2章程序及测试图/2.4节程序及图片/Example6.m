I=imread('pic8.jpg');
I=rgb2gray(I);
% ���ӽ�������
J1=imnoise(I,'salt & pepper');  
subplot(1,2,1)
imshow(J1),title('ԭʼͼ��')
% ��������ת����MATLAB��֧��ͼ����޷������͵ļ���
f=double(J1);    
% ����Ҷ�任
g=fft2(f);        
g=fftshift(g);     
[M,N]=size(g);
% ���װ�����˹(Butterworth)��ͨ�˲���
nn=2;           
d0=25;
m=fix(M/2); n=fix(N/2);
% �����ͨ�˲������ݺ���
for i=1:M
       for j=1:N
           d=sqrt((i-m)^2+(j-n)^2);
           h=1/(1+0.414*(d/d0)^(2*nn));  
           result(i,j)=h*g(i,j);
       end
end
result=ifftshift(result);
J2=ifft2(result);
J3=uint8(real(J2));
% ��ʾ�˲�������ͼ��
subplot(1,2,2)     
imshow(J3),title('�˲�������ͼ��')
