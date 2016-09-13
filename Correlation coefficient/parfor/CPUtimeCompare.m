%测试各相关系数运算时间
clear;clc;

N=1;n=20;rho=0.0;
[x,y]=my_makexy(n,N,rho);
tP=zeros(1,10);tN=tP;
Xplot=100:100:1000;

%---消除启动误差------------
for j=1:10 
    for i=1:1000
        r1=corr(x,y);
    end
end
%---------------------------

for j=1:10
    tic
    %t1=cputime;
    %t1=clock;
    for i=1:1000
        r1=corr(x,y);
    end
    tP(j)=toc;
    %t2=cputime;t=t2-t1;
    %t2=clock;t=etime(t2,t1);
end

for j=1:10
    tic
    %t1=cputime;
    %t1=clock;
    for i=1:1000
        r2=new(x,y);
    end
    tN(j)=toc;
    %t2=cputime;t=t2-t1;
    %t2=clock;t=etime(t2,t1);
end

figure
plot(Xplot,tP,'-r>')
hold on
plot(Xplot,tN,'-.bs')
%delete(findall(0,'type','figure'))%在matlab命令窗口输入，可直接关闭所有figure

