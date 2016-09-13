% �Ӻ���
function x=fwhtdya1d(data1)
% ���ܣ�ʵ��һά����Ŀ���Walsh-Hadamard�任��
% ���룺data1-���任��һά����(ע����������Ԫ�صĸ���Ϊ2�ı���)��
        % x-����Walsh-Hadamard�任��Ľ����

N=length(data1);
x=bitrevorder(data1);
L=log2(N);
k1=N;k2=1;k3=N/2;
% ���ն��壬����ѭ��
for i1=1:L      
   L1=1;
    for i2=1:k2
        for i3=1:k3
            i=i3+L1-1;j=i+k3;
            temp1=x(i); temp2=x(j);
            x(i)=temp1+temp2;
            x(j)=temp1-temp2;
        end
            L1=L1+k1;
    end
        k1=k1/2; k2=k2*2; k3=k3/2;
end
x=inv(N)*x;
