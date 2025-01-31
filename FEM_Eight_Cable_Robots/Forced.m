clc;clear all;close all
E=1.92e10; % % Young's modulus : 113Gpa
A=2^2*pi*10^-6;% cross section are m^2 
w=5.0031e3*A; %% weight per unit length 0.067 kg/m 15e3 N 
n=10;% number of elements per a cable
mass=50;
Tmax=500;% upper of Tension N
Tmin=50; % lower of Tension N
a=1.25;% x y dimentions of cable robot m
% For only one pose
Ax=0;Ay=0;Az=0;
T=Tension_Spatial_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass);
% [T,error]=Tension_Spatial_CableRobotNew(Tmin,Tmax,Ax,Ay,Az,a); % calculate the tension distribution
[f2,K,M,nodeCoordinates,elementNodes]=FEM_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a);
ksi=0;
J=2;% number of modes considering about damping
[C, coef_C]=Caughey_Damping(J,f2,M,K,ksi);
C=C*0;
alpha=0.5;
beta=0.25;
FF=-500;
DOF = size(K);  
index=DOF(1); % Degree of freedom
tmin=0;tmax=10;
dt=0.01;
% dt_cr=dt_critical(f2,alpha,beta)
% dt<dt_cr
[t,U,Udot,U2dot]=Newmark_Sy(K,M,C,f2,alpha,beta,tmin,tmax,FF,index,dt);
%=====PLOT
plot(t,U(index,:),'LineWidth',1.5);%  U
ylabel('Z   	 m');
xlabel('time');
grid on;