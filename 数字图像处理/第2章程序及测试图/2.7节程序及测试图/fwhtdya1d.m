% 子函数
function x=fwhtdya1d(data1)
% 功能：实现一维数组的快速Walsh-Hadamard变换；
% 输入：data1-待变换的一维数组(注：该数组中元素的个数为2的倍数)；
        % x-快速Walsh-Hadamard变换后的结果。

N=length(data1);
x=bitrevorder(data1);
L=log2(N);
k1=N;k2=1;k3=N/2;
% 按照定义，进行循环
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
