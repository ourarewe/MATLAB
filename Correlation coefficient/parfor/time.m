%测试运行时间
%clear;clc;
%tic
%t1=cputime;
%t1=clock;
%load sixsignals.mat;
%N=100000;n=20;rho=0.0;
%str1='sixsignals.';
%str2='St';
%x=eval([str1,str2]);
%y=rand(1000,N);
x=rand(1000,10000);
%y=rand(1000,10000);
tic
%LM1(); % function方式运行:1.909sec
%r_function=mycorr(x,y);%for循环 13.5sec  parfor循环 5.87sec
%r_cpp=corrtest(x,y);%调用matlab的corr函数 49.3s  自定义算法算corr 0.3715sec

%sort(x);    %1000X10000:0.1445
quickSort(x);%1000X10000:0.5767

toc
%t=toc
%t2=cputime;t=t2-t1;
%t2=clock;t=etime(t2,t1);