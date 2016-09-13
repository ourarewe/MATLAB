%Fig.8
clear;clc;
load iaf2.mat;
DD=preprocess(iaf2);
x=DD(:,5);y=DD(:,4);
[r1,r2]=LM3a(x,y);
LM3plota(r1,r2);

figure
boxplot([r1,r2],{'rP','rN'});
%names=c('r1','r2');
%set(gca,'XTick',0:0.2:1)
%set(gca,'XTickLabel',{'r1','r2'})
%set(gca,'YTick',0:0.2:1)
%set(gca,'YTickLabel',{'0','0.2','0.4','0.6','0.8','1'})