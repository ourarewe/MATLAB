function y=myidwt2(LL,HL,LH,HH);
% 功能： 对输入的子矩阵序列进行逆小波变换，重构出矩阵 y
% 输入：LL,HL,LH,HH —— 是四个大小均为 r*c 维的矩阵
% 输出：y —— 是一个大小为 2r*2c 维的矩阵

% 默认的低通、高通滤波器
lpr=[1 1];hpr=[1 -1];          
% 将输入的四个矩阵组合为一个矩阵
tmp_mat=[LL,HL;LH,HH];          
% 求出组合矩阵的行列数
[row,col]=size(tmp_mat);        
% 首先对组合矩阵tmp_mat的每一列，分开成上下两半
for k=1:col                     
% 分开的两部分分别作为平均系数序列ca1、细节系数序列cd1
ca1=tmp_mat(1:row/2,k);     
    cd1=tmp_mat(row/2+1:row,k);
% 重构序列
tmp1=myidwt(ca1,cd1,lpr,hpr);   
% 将重构序列存入待输出矩阵 yt 的相应列，此时 y=[L|H]
yt(:,k)=tmp1;                
end
% 将输出矩阵 y 的每一行，分开成左右两半
for j=1:row                     
% 分开的两部分分别作为低频系数序列ca2、高频系数序列cd2
ca2=yt(j,1:col/2);           
    cd2=yt(j,col/2+1:col);
% 重构序列
tmp2=myidwt(ca2,cd2,lpr,hpr);   
% 将重构序列存入待输出矩阵 yt 的相应行，得到最终的输出矩阵 y=yt
yt(j,:)=tmp2;                
end
y=yt; 
