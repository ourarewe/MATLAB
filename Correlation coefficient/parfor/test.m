%clear;clc;
%tic
x = -pi:.1:pi;
y = sin(x);
plot(x,y)
set(gca,'XTick',-pi:pi/2:pi)
%set(gca,'XTickLabel',{'-pi','-pi/2','0','pi/2','pi'})
title('Sine Function');
xlabel('Radians');
ylabel('Function Value');

%toc