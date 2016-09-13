%����LM3ģ���µĻ����,rλ������
function [r1,r2]=LM3a(SX,SY,tau)
if nargin<3,tau=-100:1:100;end
r1=zeros(size(tau,2),1);r2=r1;

for i=1:size(tau,2)
    if tau(i)<0
        Y=SY(1:end+tau(i));
        X=SX(1-tau(i):end);
    else
        Y=SY(1+tau(i):end);
        X=SX(1:end-tau(i));
    end;
    r1(i)=corr(X,Y);
    %r1(i)=corr(X,Y,'type','Spearman');
    r2(i)=new_r(X,Y,r1(i));
end
