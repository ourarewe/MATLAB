% Fig.4 Noise robustness comparison of simulation results under LM1
clear;clc;
load sixsignals.mat;
delta=30;
alpha=1;
tau=-100:1:100;
str1='sixsignals.';
str2='Se';
S=eval([str1,str2]);
noise=randn(1000-delta,1);

SX=S(delta+1:end);
SY=S(1:end-delta)+alpha.*noise;
[r1,r2]=LM3a(SX,SY,tau);
LM3plota(r1,r2,tau);
 
%----------------b----------------------------------------------------------
str=['Sp';'Sh';'St';'Sa';'Se';'Sl'];
alpha=0.1:0.1:1;
NumOfAlpha=size(alpha,2);
delta_r1=zeros(1,6);delta_r2=delta_r1;
Edelta_r1=zeros(1,NumOfAlpha);Edelta_r2=Edelta_r1;
Vdelta_r1=Edelta_r1;Vdelta_r2=Edelta_r1;
for i=1:NumOfAlpha               %alpha循环，0:0.1:1   
    for j=1:6                    %信号循环，6种信号
    S=eval([str1,str(j,1:2)]);
    SX=S(delta+1:end);        
    SY=S(1:end-delta)+alpha(i).*noise;
    [r1,r2]=LM3a(SX,SY,tau);
    [~,ix]=sort([r1,r2],1,'descend');
    delta_r1(j)=tau(ix(1,1));delta_r2(j)=tau(ix(1,2));
    end
    Edelta_r1(i)=mean(delta_r1);Edelta_r2(i)=mean(delta_r2);
    Vdelta_r1(i)=var(delta_r1);Vdelta_r2(i)=var(delta_r2);
end
figure
%hist([Edelta_r1(:),Edelta_r2(:)]);%直方图用于统计频率
h=bar([Edelta_r1(:),Edelta_r2(:)],'BaseValue',29.0);
hbl = get(h(1),'BaseLine');
set(gca,'XTick',0:0.1:1)
set(gca,'XTickLabel',{'','.1','.2','.3','.4','.5','.6','.7','.8','.9','1'})
set(gca,'YTick',29.0:0.5:31.0)
set(gca,'YTickLabel',{'29.0','29.5','30.0','30.5','31.0'})
