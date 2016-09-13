%  main_rho的函数形式 n：随机数长度，N：N对X,Y
function testfun_parfor(n,N)
rho=-1.0:0.1:1.0;
%r1=zeros(1,N);r2=r1;
Mr1=zeros(1,size(rho,2));Mr2=Mr1;Vr1=Mr1;Vr2=Mr1;V=Mr1;
for i=1:size(rho,2) 
    parfor j=1:N 
        [X,Y]=Norm2DDis_3(0,5,1,9,rho(i),n);
        r1(j)=corr(X,Y);
        r2(j)=new(X,Y);
    end
    Mr1(i)=mean(r1);Mr2(i)=mean(r2);
    Vr1(i)=var(r1);Vr2(i)=var(r2);
    V(i)=(1-rho(i)^2)^2/(n-1);
end

figure
Xplot=rho;
plot(Xplot,Mr1,'-r.');
hold on
plot(Xplot,Mr2,'-b.');
legend('pearson','new');
hold off
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' mean']);
xlabel('rho'),ylabel('E(rho)');

figure
plot(Xplot,Vr1,'--r.');
hold on
plot(Xplot,Vr2,'-.b.');
%hold on
%plot(Xplot,V,'-g');
legend('pearson','new');
title([num2str(N),'对随机数，随机数长度为:',num2str(n),' var']);
xlabel('rho'),ylabel('Var(rho)');

