function xx=fwhtdya2d(data2)
% 功能：实现二维数组的快速Walsh-Hadamard变换；
% 输入：data2-待变换的二维数组(注：该数组的行数和列数为2的倍数)；
        % xx-快速Walsh-Hadamard变换后的结果。
xx=data2;
N=length(xx);
% 对矩阵的每一行进行一维快速Walsh-Hadamard变换
for i=1:N
xx1(i,:)=fwhtdya1d(xx(i,:));
end
xx=zeros(N);
% 对变换后矩阵的每一列进行一维快速Walsh-Hadamard变换
for j=1:N
xx(:,j)=fwhtdya1d(xx1(:,j)');
end
