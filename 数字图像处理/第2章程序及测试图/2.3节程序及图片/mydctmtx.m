function [P,Q]=mydctmtx(I)
% 功能：求输入灰度图像的离散余弦变换矩阵
% 输入：I-灰度图像
% 输出：P-离散余弦矩阵P
%       Q-离散余弦矩阵Q

% 求输入灰度图像的行数和列数
[M,N]=size(I);

% 根据公式求解离散余弦矩阵P
for i=2:M
     for j=1:M
     P(i,j)=sqrt(2/M)*cos(((i-1)*(2*j-1)*pi)/(2*M));
     end
end
   P(1,:)=sqrt(1/M);
   
% 根据公式求解离散余弦矩阵Q
   for i=2:N
     for j=1:N
     Q(i,j)=sqrt(2/N)*cos(((i-1)*(2*j-1)*pi)/(2*N));
     end
end
   Q(1,:)=sqrt(1/N);
