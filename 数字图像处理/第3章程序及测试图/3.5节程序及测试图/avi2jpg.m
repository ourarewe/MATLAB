function avi2jpg(avifile,jpgfile,n)
% ���ܣ���һ��AVI��Ƶ�ļ��е���Ƶ֡�����洢Ϊ��ֹ��ͼ��
% ���룺avifile-��Ҫת����AVI�ļ�
%       jpgfile-ת�����jpg�ļ�����ǰ�벿��       
%       n-��Ҫ��ȡ��ǰn֡

% ����AVI�ļ������ݷ���MATLAB Movie��ʽ
mov=aviread(avifile);

% ��λMATLAB Movie���ļ�������
temp=size(mov);
fnum=temp(2);
if n<fnum
    m=n;
else
    m=fnum
end

% ��֡��ȡ���ݣ�������Ϊjpg�ļ�
for i=1:n
    strtemp=strcat(jpgfile,int2str(i),'.jpg');
    imwrite(mov(i).cdata(:,:,:),strtemp)
end
