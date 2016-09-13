function psnr=PSNR(A,B)
 % 功能：计算两幅图像的PSNR值
% 输入：灰度图像A、B
 % 输出：psnr的值
 
 % 判断图像的大小是否一致、是否是一幅图像
sizeA=size(A);sizeB=size(B);
if sizeA~=sizeB
 		   error('Image A and B are not of the same size')
end
 
if A==B
 		   error('Images are identical: PSNR has infinite value')
end
 
 % 判断图像的灰度值是否在0～255之间
max2_A=max(max(A));
max2_B=max(max(B));
min2_A=min(min(A));
min2_B=min(min(B));
 
if max2_A>255 ||max2_B>255 ||min2_A<0||min2_B<0
 		   error('input matrices must have values in the interval [0,255]')
end
 
% 计算PSNR的值
error_diff=A-B;
psnr=20*log10(255/(sqrt(mean(mean(error_diff.^2)))));
disp(sprintf('PSNR=+%5.2fdB',psnr))
