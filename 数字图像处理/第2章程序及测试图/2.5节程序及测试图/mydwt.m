function [cA,cD] = mydwt(x,lpd,hpd,dim)
% 功能：对输入序列x进行一维离散小波分解
% 输入：x——输入序列
%          lpd——低通滤波器
%          hpd——高通滤波器
%          dim——小波分解级数
% 输出：cA——低频小波分解系数
%           cD——高频小波分解系数

% 初始化cA，cD
cA=x;       
cD=[ ];
for i=1:dim
% 低通滤波，为了提高运行速度，调用MATLAB提供的卷积函数conv()
cvl=conv(cA,lpd);   
% 通过下抽样求出平均部分的分解系数
dnl=downspl(cvl);   
% 高通滤波
cvh=conv(cA,hpd);   
% 通过下抽样求出本层分解后的细节部分系数
dnh=downspl(cvh);  
% 下抽样后的平均部分系数进入下一层分解
cA=dnl;    
  % 将本层分解所得的细节部分系数存入序列cD       
cD=[cD,dnh];        
end
