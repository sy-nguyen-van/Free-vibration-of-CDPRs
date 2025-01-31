clear all;clc
omega_max=45;
number=440;
omega=linspace(1,omega_max,number);
omega=omega';
F=1500;
Force=F*ones(number,1);
Load=[omega,Force];
save('Load_FRF.txt','Load','-ascii')