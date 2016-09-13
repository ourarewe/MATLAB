function y=mywaverec2(x,dim)
% ���ܣ� ����ķֽ�ϵ������x���� dim ���ع�
% ���룺x �����ֽ�ϵ������
%           dim �����ع�������
% �����y �����ع�����
% ���Ʒֽ�ͼ��
% �������������ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
xd=uint8(x);            
% �����������������
[m,n]=size(x);          
% ��ת������xd���зֽ��ߴ���
for i=1:dim             
m=m-mod(m,2);
n=n-mod(n,2);
xd(m/2,1:n)=255;
xd(1:m,n/2)=255;
m=m/2;n=n/2;
end
figure;
% �������зֽ��ߵķֽ�ͼ��
subplot(121);imshow(xd);title([ num2str(dim) ' ��С���ֽ�ͼ��']); 
% �ع�ͼ��
% �������������ݸ�ʽת�����ʺ���ֵ�����double��ʽ
xr=double(x);           
% ���ת������xr��������
[row,col]=size(xr);    
% �ع������Ǵ��ڲ��������У������ȳ�ȡ���� xr �����ڲ�ֽ��������ع�
for i=dim:-1:1    
 % �ع����ڲ�������������Ϊ����xr��2^(i-1)��     
tmp=xr(1:floor(row/2^(i-1)),1:floor(col/2^(i-1)));      
% ��ȡ���ع����� tmp ��������
[rt1,ct1]=size(tmp);                         
rt=rt1-mod(rt1,2);ct=ct1-mod(ct1,2);
% �����ع����� tmp �ֽ�Ϊ�ĸ�����
rLL=tmp(1:rt/2,1:ct/2);                    
rHL=tmp(1:rt/2,ct/2+1:ct);
rLH=tmp(rt/2+1:rt,1:ct/2);
rHH=tmp(rt/2+1:rt,ct/2+1:ct);
% ���ع�������ص����� tmp
tmp(1:rt,1:ct)=myidwt2(rLL,rHL,rLH,rHH);              
% �Ѿ��� tmp �����ݷ��ص����� xr ����Ӧ����׼����һ�������ع�
xr(1:rt1,1:ct1)=tmp;       
end
% �ع�������õ��ľ���xr��Ϊ������� y
y=xr;                   
% ������xr�����ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
yu=uint8(xr);            
subplot(122);imshow(yu);title('С���ع�ͼ��');
