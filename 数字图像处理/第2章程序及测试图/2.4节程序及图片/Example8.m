% ����RGBͼ�񲢽���ת���ɻҶ�ͼ��
I=imread('pic12.jpg');
I=rgb2gray(I);
subplot(1,2,1);
imshow(I)
title('ԭʼͼ��')
% ��������ת����MATLAB��֧���޷�����ѧ�ļ���
f=double(I); 
 % ����Ҷ�任
k=fft2(f);      
g=fftshift(k);  
[M,N]=size(g);
% ���װ�����˼��ͨ�˲�������ֹƵ��Ϊ25
nn=2;           
d0=25;
m=fix(M/2);
n=fix(N/2);
 
% ���㴫�ݺ���
for i=1:M
    for j=1:N
        d=sqrt((i-m)^2+(j-n)^2);
        if(d==0)
            h=0;
        else
            h=1/(1+0.414*(d0/d)^(2*nn));  
        end
        result(i,j)=h*g(i,j);
    end
end
 
result=ifftshift(result);
J2=ifft2(result);
J3=uint8(real(J2));
subplot(1,2,2);
imshow(J3); 
title('�˲�֮��Ľ��')
