function fc = csf()
% ���ܣ�����CSF�ĺ��ĺ���������HVS�ռ�ĶԱȶ����к���CSF
% ���:   fc-- CSF���˲���ϵ��
% �ο�����:
%   Makoto Miyahara
%   "Objective Picture Quality Scale (PQS) for Image Coding"
%   IEEE Trans. on Comm., Vol 46, No.9, 1998.

    % ����Ƶ����Ӧ����
Fmat = csfmat;

    % ����FSAMP2����2D�˲���ϵ��
    fc = fsamp2(Fmat);   
    
