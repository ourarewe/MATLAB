function [c]=autocorcoeficient(A,shiftx,shifty)
% ���ܣ���������ͼ�������غ���
% ���룺A-��ά�Ҷ�ͼ�����
%       shiftx,shifty-ƫ������
 %�����c-��ά�Ҷ�ͼ�������غ�����
[M,N]=size(A);
B=zeros(M+abs(shiftx),N+abs(shifty));
A=double(A);
B=double(B);
%ƫ������������ͼ��Χ֮�������ֵΪ0
if(shiftx>0)&&(shifty>0)
B(1:M,1:N)=A;
end
if(shiftx>0)&&(shifty<0)
B(1:M,abs(shifty)+1:abs(shifty)+N)=A;
end
if(shiftx<0)&&(shifty>0)
B(abs(shiftx)+1:abs(shiftx)+M,1:N)=A;
end
if(shiftx<0)&&(shifty<0)
B(abs(shiftx)+1:abs(shiftx)+M,abs(shifty)+1:abs(shifty)+N)=A;
end
%���������ϵ��
sum1=0;
sum2=0;
for i=1:M
    for j=1:N
        sum1=sum1+A(i,j)*B(i,j);
        sum2=sum2+A(i,j)*A(i,j);
    end
end
c=sum1/sum2;
