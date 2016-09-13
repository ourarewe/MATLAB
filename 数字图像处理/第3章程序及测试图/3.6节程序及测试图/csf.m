function fc = csf()
% 功能：计算CSF的核心函数，计算HVS空间的对比度敏感函数CSF
% 输出:   fc-- CSF的滤波器系数
% 参考文献:
%   Makoto Miyahara
%   "Objective Picture Quality Scale (PQS) for Image Coding"
%   IEEE Trans. on Comm., Vol 46, No.9, 1998.

    % 计算频率响应矩阵
Fmat = csfmat;

    % 采用FSAMP2计算2D滤波器系数
    fc = fsamp2(Fmat);   
    
