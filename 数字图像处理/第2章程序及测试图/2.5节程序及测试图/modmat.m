function y=modmat(x,dim)
% ���ܣ��������x���й淶����ʹ�����������ܱ� 2^dim ����
% ���룺x ���� r*c ά����
%           dim ���� �����ع���ά��
% �����y ���� rt*ct ά����mod(rt,2^dim)=0��mod(ct,2^dim)=0

% �����������������row,col
[row,col]=size(x);         
% ��row,col�ֱ��ȥ����ģ 2^dim �õ����������õĲ�Ϊrt��ct�����ܱ� 2^dim ����
rt=row - mod(row,2^dim);    
% ������� y Ϊ������� x �� rt*ct ά�Ӿ���
ct=col - mod(col,2^dim);    y=x(1:rt,1:ct);             
