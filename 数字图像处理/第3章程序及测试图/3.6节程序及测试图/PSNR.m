function psnr=PSNR(A,B)
 % ���ܣ���������ͼ���PSNRֵ
% ���룺�Ҷ�ͼ��A��B
 % �����psnr��ֵ
 
 % �ж�ͼ��Ĵ�С�Ƿ�һ�¡��Ƿ���һ��ͼ��
sizeA=size(A);sizeB=size(B);
if sizeA~=sizeB
 		   error('Image A and B are not of the same size')
end
 
if A==B
 		   error('Images are identical: PSNR has infinite value')
end
 
 % �ж�ͼ��ĻҶ�ֵ�Ƿ���0��255֮��
max2_A=max(max(A));
max2_B=max(max(B));
min2_A=min(min(A));
min2_B=min(min(B));
 
if max2_A>255 ||max2_B>255 ||min2_A<0||min2_B<0
 		   error('input matrices must have values in the interval [0,255]')
end
 
% ����PSNR��ֵ
error_diff=A-B;
psnr=20*log10(255/(sqrt(mean(mean(error_diff.^2)))));
disp(sprintf('PSNR=+%5.2fdB',psnr))
