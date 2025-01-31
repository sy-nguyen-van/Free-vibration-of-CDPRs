clc;clear all;close all
addpath Analytical_Eight
format long
E=2.01e10; % Young's modulus : 113Gpa
A=4^2*pi*10^-6;% cross section are m^2
w=0.251; % weight per unit length
n=40; %
mass=30;
Tmax=1000;% upper of Tension N
Tmin=100;% lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
% For FEM
Ax=0;Ay=0;Az=1.25;
T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
[f2,K,M,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
f2(1:5)
Case=0;% 1 not 0 else 
w_max=40;
number=390;
if Case==1
%===Not Additional Frequencies==
beta=linspace(1,w_max,number);
XY=load('SAP_F1500_1_28_Hz.txt');
XY=log10(abs(XY));
%===Included Additional Frequencies==
else
esp=1e-9;
mode=35;
x1=linspace(1,w_max,number);
x2=f2(1:mode)+1*esp;
x3=f2(1:mode)+2*esp;
x4=f2(1:mode)+3*esp;
x5=f2(1:mode)-1*esp;
x6=f2(1:mode)-2*esp;
x7=f2(1:mode)-3*esp;
beta=unique(sort([x1';x2;x3;x4;x5;x6;x7]));
XY=load('SAP_F1500_1_40_Hz_400_T100.txt');
XY(:,2)=log10((XY(:,2)));
end
F0=-1500;
Ampli=Steady_State_Response(f2,K,M,F0,beta);
Ampli1=log10((Ampli));
% ===========Modified Analytical============
Ax=0;Ay=0;Az=1.25;
T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
[f2,K1,M1,nodeCoordinates,elementNodes]=Analytical_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
f2(1:5)
Case=0;% 1 not 0 else 
w_max=40;
number=390;
if Case==1
%===Not Additional Frequencies==
beta=linspace(1,w_max,number);
XY=load('SAP_F1500_1_28_Hz.txt');
XY=log10(abs(XY));
%===Included Additional Frequencies==
else
esp=1e-20;
mode=35;
x1=linspace(1,w_max,number);
x2=f2(1:mode)+1*esp;
x3=f2(1:mode)+2*esp;
x4=f2(1:mode)+3*esp;
x5=f2(1:mode)-1*esp;
x6=f2(1:mode)-2*esp;
x7=f2(1:mode)-3*esp;
beta=unique(sort([x1';x2;x3;x4;x5;x6;x7]));
XY=load('SAP_F1500_1_40_Hz_400_T100.txt');
XY(:,2)=log10((XY(:,2)));
end
F0=-1500;
Ampli=Steady_State_Response(f2,K,M,F0,beta);
Ampli2=log10((Ampli));
%=========PLOTTING======================
% plot(beta,Ampli1,'LineWidth',2);
hold on;grid on
plot(beta,Ampli2,'LineWidth',2);
hold on
plot(XY(:,1),XY(:,2),'--red','LineWidth',2);
%====Label=====
ylabel('H(\omega)','FontSize',12,'FontWeight','bold','Color','k')
xlabel('\omega (Hz)','FontSize',12,'FontWeight','bold','Color','k')
legend('FEM','SAP2000','FontSize',10,'FontWeight','bold')