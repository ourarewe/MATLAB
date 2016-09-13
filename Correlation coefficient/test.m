clear;clc;
%分别画出各随机数长度（n）的均值方差图
%N=1000;% X Y对数
tic
matlabpool open
N=100000;% X Y长度
parfor i=2:4
    n=i*10;
    testfun(n,N);
end
matlabpool close
toc