clear;clc;
%�ֱ𻭳�����������ȣ�n���ľ�ֵ����ͼ
%N=1000;% X Y����
tic
matlabpool open
N=100000;% X Y����
parfor i=2:4
    n=i*10;
    testfun(n,N);
end
matlabpool close
toc