function ImOut=myzoom(ImIn,j)
% ���ܣ� ����˫���Բ�ֵ��ͼ����зŴ�
% ���룺 ImIn-���Ŵ�ĻҶ�ͼ��
%          j-�Ŵ����ӣ���ͼ��Ŵ�2j��
% ����� ImOut-�Ŵ���ͼ��

A=double(ImIn);
[a,b]=size(A);
 
% �зŴ�2j��
x=2^j;
for t=0:x-1
    for k=1:a
        for l=1:b
            if t==x-1
                temp(k*x-t,l)=A(k,l);
            else
                temp(k*x-t,l)=0;
            end
        end
    end
end
 
% �зŴ�2j��
for t=0:x-1
    for k=1:a*x
        for l=1:b
            if t==2^j-1
                ImOut(k,l*x-t)=temp(k,l);
            else
                ImOut(k,l*x-t)=0;
            end
        end
    end
end
 
% ���н������Բ�ֵ
for t=1:x-1
    for k=1:a-1
        for l=1:b*x
            ImOut(k*x-t+1,l)=ImOut(k*x-x+1,l)+...
                (ImOut((k+1)*x-x+1,l)-ImOut(k*x-x+1,l))/x*(x-t);
        end
    end
end
 
% ���н������Բ�ֵ
for t=1:x-1
    for k=1:a*x
        for l=1:b-1
            ImOut(k,l*x-t+1)=ImOut(k,l*x-x+1)+...
                (ImOut(k,(l+1)*x-x+1)-ImOut(k,l*x-x+1))/x*(x-t);
        end
    end
end
 
return
