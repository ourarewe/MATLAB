function r=imrotateli(I,theta)
% ���ܣ�������ĻҶ�ͼ�������ת
% ���룺I-����ת�ĻҶ�ͼ��
%       theta-��ת�ĽǶ�
% �����r-��ת���ͼ��
 
[h0 w0]=size(I);
theta=(theta*pi/180);
cosa=cos(theta);
sina=sin(theta);
 
% ͼ��ԭ�ĸ���������
srcx1=-w0*0.5;srcy1=h0*0.5;
srcx2=w0*0.5; srcy2=h0*0.5;
srcx3=-w0*0.5; srcy3=-h0*0.5;
srcx4=w0*0.5; srcy4=-h0*0.5;
 
% ͼ����ת���ĸ���������
dstx1=cosa*srcx1-sina*srcy1;
dsty1=sina*srcx1+cosa*srcy1;
dstx2=cosa*srcx2-sina*srcy2;
dsty2=sina*srcx2+cosa*srcy2;
dstx3=cosa*srcx3-sina*srcy3;
dsty3=sina*srcx3+cosa*srcy3;
dstx4=cosa*srcx4-sina*srcy4;
dsty4=sina*srcx4+cosa*srcy4;

% ������ת��ͼ��Ŀ����߶�
% ��ת��ͼ��ĸ�Ϊ��Ӧ����������֮��Ľϴ�ֵ
h=max(abs(dsty4-dsty1),abs(dsty2-dsty3))+0.5;
% ��ת��ͼ��Ŀ�Ϊ��Ӧ����������֮��Ľϴ�ֵ
w=max(abs(dstx4-dstx1),abs(dstx2-dstx3))+0.5;

% ����ͼ��ĸߺͿ���������������
h=floor(h);
w=floor(w);
 
r=zeros(h,w);
% ������������
f1=-w*0.5*cosa-h*0.5*sina+0.5*w0;
f2=w*0.5*sina-h*0.5*cosa+0.5*h0;
 
for x=1:w
    for y=1:h
        x0=floor(x*cosa+y*sina+f1);  % �������Ϊ����
        y0=floor(-x*sina+y+cosa+f2);
 % �����ؽ������
        if x0>0&&x0<=w0&&y0>0&&y0<=h0
            r(y,x)=I(y0,x0);
        end
    end
end
% ��ʾԭʼͼ�񼰱任֮���ͼ��
subplot(121), imshow(I);
subplot(122), imshow(r,[]);
