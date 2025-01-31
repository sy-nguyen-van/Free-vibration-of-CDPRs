clc;clear all;close all
addpath Analytical_Eight
% Form stiffness matrix K. mass matrix M, and damping constant C
E=2.01e10; % Young's modulus : 113Gpa
A=4^2*pi*10^-6;% cross section are m^2
w=0.251; % weight per unit length
n=40; %
mass=30;
Tmax=1000;% upper of Tension N
Tmin=100;% lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
Ax=0;Ay=0;Az=1.25;
T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
[f2,K,M,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
C=K*0;
alpha=0.5;beta=0.25;
DOF = size(K);  
index=DOF(1); % Degree of freedom
tmin=0;tmax=1;
dt=0.001;
FF=-1500;
omega=5;% External Frequency
[t,U1,Udot1,U2dot1]=Newmark_Sy(K,M,C,tmin,tmax,FF,dt,omega);
% % For Analytical 
T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
[f2,K,M,nodeCoordinates,elementNodes]=Analytical_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
C=K*0;
alpha=0.5;beta=0.25;
DOF = size(K);  
index=DOF(1); % Degree of freedom
tmin=0;tmax=1;
dt=0.001;
FF=-1500;
omega=5;% External Frequency
[t,U2,Udot2,U2dot2]=Newmark_Sy(K,M,C,tmin,tmax,FF,dt,omega);
%=====PLOT==============================
plot(t,U1(index,:)*1e3,'-b','LineWidth',2);%  U1
grid on;hold on;
plot(t,U2(index,:)*1e3,'--k','LineWidth',2);%  U2
hold on
XY=load('Newmark_1500_1s_5Hz.txt');
plot(XY(:,1),XY(:,2)*10^3,'--red','LineWidth',2);%U3
legend('FEM','Modified-Analytical','SAP2000','FontSize',10,'FontWeight','bold')