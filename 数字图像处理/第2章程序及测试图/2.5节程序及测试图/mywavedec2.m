function y=mywavedec2(x,dim)
% ���ܣ�������ͼ����� x ���� dim ��ֽ⣬�õ���Ӧ�ķֽ�ϵ������ y
% ���룺x ���� ����ͼ�����
%           dim ���� �ֽ����
% �����y ���� �ֽ�ϵ������

% ���ȹ淶���������ʹ�����������ܱ� 2^dim ����
x=modmat(x,dim);            
% �����淶�����ͼ��
subplot(121);imshow(x);title('ԭʼͼ��');   
% ����淶������x��������
[m,n]=size(x);              
% ������x�����ݸ�ʽת��Ϊ�ʺ���ֵ�����double��ʽ
xd=double(x);               
for i=1:dim
    xd=modmat(xd,1);
% С���ֽ�
[dLL,dHL,dLH,dHH]=mydwt2(xd);   
% ���ֽ�ϵ�����뻺�����
tmp=[dLL,dHL;dLH,dHH];          
 % ������������Ͻǲ��ֵ��Ӿ�����Ϊ��һ��ֽ��Դ����
xd=dLL;                         
% �����������������
[row,col]=size(tmp);            
% ����������������������Ӧ����
y(1:row,1:col)=tmp;             
end
% �������������ݸ�ʽת��Ϊ�ʺ���ʾͼ���uint8��ʽ
yd=uint8(y);            
% �Ծ��� yd ���зֽ��ߴ��������ֽ�ͼ��ķֽ���
for i=1:dim             
    m=m-mod(m,2);
    n=n-mod(n,2);
    yd(m/2,1:n)=255;
    yd(1:m,n/2)=255;
    m=m/2;n=n/2;
end
subplot(122);imshow(yd);title([ num2str(dim) ' ��С���ֽ�ͼ��']); 
