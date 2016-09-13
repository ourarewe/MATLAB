function y = myidwt(cA,cD,lpr,hpr);
%  功能：输入的小波分解系数进行逆离散小波变换
%  输入：cA —— 低频部分的小波分解系数
%            cD —— 高频部分的小波分解系数
%           lpr、hpr —— 重构所用的低通、高通滤波器
%  输出：y —— 重构后的信号序列

% 求出低频、高频部分分解系数的长度
lca=length(cA);             
lcd=length(cD);
% 每一层重构中，cA 和 cD 的长度要相等，若lcd小于lca，这时的 cA 即为重构信号序列 y
while (lcd)>=(lca)          
  % 对低频部分系数进行上抽样
upl=upspl(cA);         
% 低通卷积
cvl=conv(upl,lpr);     
% 取出本层重构所需的高频部分系数，长度与本层平均部分系数的长度相等
  cD_up=cD(lcd-lca+1:lcd);   
% 对高频部分系数进行上抽样
uph=upspl(cD_up);       
% 高通卷积
cvh=conv(uph,hpr);      
% 用本层重构的序列更新cA，以进行下一层重构
cA=cvl+cvh;             
% 舍弃本层重构用到的高频部分系数，更新cD
cD=cD(1:lcd-lca);       
% 求出下一层重构所用的低频、高频部分系数的长度
lca=length(cA);         
lcd=length(cD);
end                        
% 输出的重构序列 y 等于重构完成后的平均部分系数序列 cA
y=cA;                       
