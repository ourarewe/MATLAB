function xx=fwhtdya2d(data2)
% ���ܣ�ʵ�ֶ�ά����Ŀ���Walsh-Hadamard�任��
% ���룺data2-���任�Ķ�ά����(ע�������������������Ϊ2�ı���)��
        % xx-����Walsh-Hadamard�任��Ľ����
xx=data2;
N=length(xx);
% �Ծ����ÿһ�н���һά����Walsh-Hadamard�任
for i=1:N
xx1(i,:)=fwhtdya1d(xx(i,:));
end
xx=zeros(N);
% �Ա任������ÿһ�н���һά����Walsh-Hadamard�任
for j=1:N
xx(:,j)=fwhtdya1d(xx1(:,j)');
end
