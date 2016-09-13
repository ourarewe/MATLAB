clear;clc;
n=100;

X=-100+200*rand(1,n);
%Y=-50+100*rand(1,n);
Y=-X+(20.*rand(1,n)-10);
%Y=-1./(1+exp(-X));
Xs=sort(-X);
Ys=sort(Y);
r1 = pearson(X,Y);
r2 = pearson(Xs,Ys);
r=newcorr(X,Y);

subplot(131);plot(X,Y,'r.');xlabel('X'),ylabel('Y');title('Y=-X');
subplot(132);plot(-X,Y,'g.');xlabel('-X'),ylabel('Y');title('-X,Y');
subplot(133);plot(Xs,Ys,'b.');xlabel('X'),ylabel('Y');title('sort');

