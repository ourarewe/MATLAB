function f = WPSNR(A,B)
 
% ���ܣ����öԱȶ����к������в�ֵͼ��ļ�Ȩ����������ͼ��ļ�Ȩ��ֵ�����
% ���룺�Ҷ�ͼ��A��B��ע������ͼ��ĻҶ�ֵ��ΧΪ0��1��
% ���������ͼ��ļ�Ȩ��ֵ�����
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
        fc = csf;   % CSF���˲���ϵ��
    else
        fc = varargin{1};
    end
    ew = filter2(fc, e);        % ����CSF���˲����
    
    decibels = 20*log10(1/(sqrt(mean(mean(ew.^2)))));
    f=decibels;
