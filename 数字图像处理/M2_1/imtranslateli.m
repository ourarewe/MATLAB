function outimage=imtranslateli(I,deltax,deltay,zoo)
%����
%���룺I-����Ĵ������ͼ��
%      deltax-��x���ƫ����
%      deltay-��y���ƫ����
%      zoo-��������
%�����outimage-�����ƽ�ƺ��ͼ��
 
[m,n]=size(I);
%�����Ƿ���������ӣ�Ĭ���ǻ���������
zoom=0;             
if nargin>3
%��������
    zoom=zoo;       
end
if zoom
    outimage=zeros(m+deltax,n+deltay);
else
    outimage=zeros(m,n);
end
%�����ͼ���ʼ��
[m0 n0]=size(outimage);        
for y=1:n0
    for x=1:m0
        x0=x-deltax;
        y0=y-deltay;
        if x0>=1&&x0<=m&&y0>=1&&y0<=n
%����ͼ���е����ظ�ֵ
            outimage(x,y)=I(x0,y0);            
        end
    end
end

%��ʾͼ��
subplot(121),imshow(I),title('ԭʼͼ��');    
subplot(122), imshow(uint8(outimage)),title('ƽ�ƺ��ͼ��');
