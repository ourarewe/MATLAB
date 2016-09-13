%LM3.b 据算N次
function LM3b(S,N,noise,delta,tau)
alpha=0.1:0.1:1;
NumOfAlpha=size(alpha,2);
delta_r1=zeros(1,N);delta_r2=delta_r1;
Edelta_r1=zeros(1,NumOfAlpha);Edelta_r2=Edelta_r1;
%Vdelta_r1=Edelta_r1;Vdelta_r2=Edelta_r1;
SD_r1=Edelta_r1;SD_r2=Edelta_r1;
SX=S(delta+1:end);Sx=S(1:end-delta);
for i=1:NumOfAlpha              %alpha循环，0:0.1:1        
    SY=LM(1,Sx,alpha(i),noise);
    for j=1:N
        [r1,r2]=LM3a(SX,SY(:,j),tau);
        [~,ix]=sort([r1,r2],1,'descend');
        delta_r1(j)=tau(ix(1,1));delta_r2(j)=tau(ix(1,2));
    end
    i
    Edelta_r1(i)=mean(delta_r1)
    Edelta_r2(i)=mean(delta_r2)
    %Vdelta_r1(i)=var(delta_r1);Vdelta_r2(i)=var(delta_r2);
    SD_r1(i)=std(delta_r1);SD_r2(i)=std(delta_r2);
end

figure
%hist([Edelta_r1(:),Edelta_r2(:)]);%直方图用于统计频率
h=bar([Edelta_r1(:),Edelta_r2(:)],1,'BaseValue',29.0);
hold on
%hbl = get(h(1),'BaseLine');
%set(gca,'XTick',0:0.1:1)
set(gca,'XTickLabel',{'.1','.2','.3','.4','.5','.6','.7','.8','.9','1'})
set(gca,'YTick',29.0:0.5:31.0)
set(gca,'YTickLabel',{'29.0','29.5','30.0','30.5','31.0'})

xplot =get(get(h(1),'children'), 'xdata');
xplot = mean(xplot([1 3],:));
errorbar(xplot, Edelta_r1, SD_r1(:),'b','linestyle', 'none');
set(gca,'children', flipud(get(gca,'children')));

xplot =get(get(h(2),'children'), 'xdata');
xplot = mean(xplot([1 3],:));
errorbar(xplot, Edelta_r1, SD_r2(:),'r','linestyle', 'none');
set(gca,'children', flipud(get(gca,'children')));

