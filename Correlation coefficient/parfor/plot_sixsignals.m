clear;clc;
load sixsignals.mat;
xplot=1:1000;
figure
plot(xplot,sixsignals.Sp(:),'-r')
figure
plot(xplot,sixsignals.Sh(:),'-b')
figure
plot(xplot,sixsignals.St(:),'-y')
figure
plot(xplot,sixsignals.Sa(:),'-g')
figure
plot(xplot,sixsignals.Se(:),'-c')
figure
plot(xplot,sixsignals.Sl(:),'-k')
