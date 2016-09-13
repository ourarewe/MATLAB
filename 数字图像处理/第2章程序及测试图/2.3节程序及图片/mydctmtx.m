function [P,Q]=mydctmtx(I)
% ���ܣ�������Ҷ�ͼ�����ɢ���ұ任����
% ���룺I-�Ҷ�ͼ��
% �����P-��ɢ���Ҿ���P
%       Q-��ɢ���Ҿ���Q

% ������Ҷ�ͼ�������������
[M,N]=size(I);

% ���ݹ�ʽ�����ɢ���Ҿ���P
for i=2:M
     for j=1:M
     P(i,j)=sqrt(2/M)*cos(((i-1)*(2*j-1)*pi)/(2*M));
     end
end
   P(1,:)=sqrt(1/M);
   
% ���ݹ�ʽ�����ɢ���Ҿ���Q
   for i=2:N
     for j=1:N
     Q(i,j)=sqrt(2/N)*cos(((i-1)*(2*j-1)*pi)/(2*N));
     end
end
   Q(1,:)=sqrt(1/N);
