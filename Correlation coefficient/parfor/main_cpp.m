% matlabpool open   matlabpool close

clc;clear;
tic;
N=100000;
n=1000;
rho=-1.0:0.2:1.0;
Mr1=zeros(1,size(rho,2));Mr2=Mr1;Vr1=Mr1;Vr2=Mr1;V=Mr1;

parfor i=1:size(rho,2) 
    [Mr1(i),Mr2(i),Vr1(i),Vr2(i)]=MandV_cpp(rho(i),n,N);
    V(i)=(1-rho(i)^2)^2/(n-1);
    i
end

figure
plot(rho,Mr1,'-r.');
hold on
plot(rho,Mr2,'-b.');
legend(['\rho','P'],['\rho','N'],4);legend boxoff;
hold off
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' mean']);
xlabel('\rho'),ylabel(['E(','\rho',')']);
%saveas(gcf,['n=',num2str(n),' N=',num2str(N),' mean','.jpg']);

figure
plot(rho,Vr1,'-r.');
hold on
plot(rho,Vr2,'--b.');
hold on
plot(rho,V,'-g');
legend(['\rho','P'],['\rho','N'],'\rho');legend boxoff;
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' var']);
xlabel('\rho'),ylabel(['Var(','\rho',')']);
%saveas(gcf,['n=',num2str(n),' N=',num2str(N),' var','.jpg']);

toc