clear all;clc;close all
figure()
Y1=[13.768		15.895		16.38		16.368];
X1=[60 80 100 120];
plot(X1,Y1,'-o','Linewidth',1.5)
grid on
xlabel('Tmin [N]','FontSize',12,'FontWeight','bold','Color','k')
ylabel('The first natural frequency [Hz]','FontSize',12,'FontWeight','bold','Color','k')
