%作图Fig.4 a,可以加标题
function LM3plota(r1,r2,tau)
if nargin<4 ,str2='';end
if nargin<3,tau=-100:1:100;end
close all
figure
plot(tau,r1,'-r');
hold on
plot(tau,r2,'-b');
set(gca,'XTick',-100:50:100)
set(gca,'XTickLabel',{'-100','-50','0','50','100'})
set(gca,'YTick',-0.2:0.2:0.8)
set(gca,'YTickLabel',{'-0.2','0','0.2','0.4','0.6','0.8','1'})
legend(['\rho','P'],['\rho','N'],2);legend boxoff;
xlabel('\kappa'),ylabel(['r','\xi']);
title(str2);
hold off