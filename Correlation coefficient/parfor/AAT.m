%TABLE1:AAT comparison results among 2 methods ±£¡Ù“‚º˚
clear;clc;
load sixsignals.mat;
N=1;
rho=-1.0:0.01:1.0;
noise=randn(1000,N);
AAT_P=zeros(6,1);AAT_N=AAT_P;
r1=zeros(N,size(rho,2));r2=r1;
Er1=zeros(6,size(rho,2));Er2=r1;
X(:,1)=sixsignals.Sp;
X(:,2)=sixsignals.Sh;
X(:,3)=sixsignals.St;
X(:,4)=sixsignals.Sa;
X(:,5)=sixsignals.Se;
X(:,6)=sixsignals.Sl;
for j=1:6
    repX=repmat(X(:,j),1,N);
    for i=1:size(rho,2)
        
        Y=rho(i).*repX+sqrt(1-rho(i)^2).*noise;
        r1(:,i)=corr(X(:,j),Y);
        %r2(:,i)=new_r(X(:,i),Y,r1(j,i));
    end
    Er1(j,:)=mean(r1,1);%Er2(i)=mean(r2);
    AAT_P(j)=sum(abs(Er1(j,:)-rho).*0.01./4);
    %AAT_N(j)=sum(abs(Er2-rho).*0.01./4);
end

