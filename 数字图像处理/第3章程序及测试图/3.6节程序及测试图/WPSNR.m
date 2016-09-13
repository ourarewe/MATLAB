function f = WPSNR(A,B)
 
% 功能：采用对比度敏感函数进行差值图像的加权来计算两幅图像的加权峰值信噪比
% 输入：灰度图像A、B（注意两幅图像的灰度值范围为0～1）
% 输出：两幅图像的加权峰值信噪比
    if A == B
    error('Images are identical: PSNR has infinite value')
    end
 
    max2_A = max(max(A));
    max2_B = max(max(B));
    min2_A = min(min(A));
    min2_B = min(min(B));
 
    if max2_A > 1 | max2_B > 1 | min2_A < 0 | min2_B < 0
    error('input matrices must have values in the interval [0,1]')
    end
 
    e = A - B;
    if nargin<3
        fc = csf;   % CSF的滤波器系数
    else
        fc = varargin{1};
    end
    ew = filter2(fc, e);        % 运用CSF的滤波误差
    
    decibels = 20*log10(1/(sqrt(mean(mean(ew.^2)))));
    f=decibels;
