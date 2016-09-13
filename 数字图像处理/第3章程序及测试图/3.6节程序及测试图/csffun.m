function Sa = csffun(u,v)
%========================
% 功能：计算差值图像的空间频率加权系数
% 输入：u ---水平空域频率
%       v ---垂直空域频率
% 输出：频率响应
% 参考文献:
%   Makoto Miyahara
%   "Objective Picture Quality Scale (PQS) for Image Coding"
%   IEEE Trans. on Comm., Vol 46, No.9, 1998.

    sigma = 2;
    f = sqrt(u.*u+v.*v);
    w = 2*pi*f/60;
    Sw = 1.5*exp(-sigma^2*w^2/2)-exp(-2*sigma^2*w^2/2);
 
    % 修改高频部分
    sita = atan(v./(u+eps));
    bita = 8;
    f0 = 11.13;
    w0 = 2*pi*f0/60;
    Ow = ( 1 + exp(bita*(w-w0)) * (cos(2*sita))^4) / (1+exp(bita*(w-w0)));
 
    % 计算最终响应
    Sa = Sw * Ow;
