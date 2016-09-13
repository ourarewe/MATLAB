function Sa = csffun(u,v)
%========================
% ���ܣ������ֵͼ��Ŀռ�Ƶ�ʼ�Ȩϵ��
% ���룺u ---ˮƽ����Ƶ��
%       v ---��ֱ����Ƶ��
% �����Ƶ����Ӧ
% �ο�����:
%   Makoto Miyahara
%   "Objective Picture Quality Scale (PQS) for Image Coding"
%   IEEE Trans. on Comm., Vol 46, No.9, 1998.

    sigma = 2;
    f = sqrt(u.*u+v.*v);
    w = 2*pi*f/60;
    Sw = 1.5*exp(-sigma^2*w^2/2)-exp(-2*sigma^2*w^2/2);
 
    % �޸ĸ�Ƶ����
    sita = atan(v./(u+eps));
    bita = 8;
    f0 = 11.13;
    w0 = 2*pi*f0/60;
    Ow = ( 1 + exp(bita*(w-w0)) * (cos(2*sita))^4) / (1+exp(bita*(w-w0)));
 
    % ����������Ӧ
    Sa = Sw * Ow;
