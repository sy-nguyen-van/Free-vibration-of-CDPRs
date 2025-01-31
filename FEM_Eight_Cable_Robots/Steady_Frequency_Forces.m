clc;clear all;close all
E=1.92e10; % % Young's modulus : 113Gpa
A=2^2*pi*10^-6;% cross section are m^2 
w=5.0031e3*A; %% weight per unit length 0.067 kg/m 15e3 N 
n=10;% number of elements per a cable
mass=30;
Tmax=350;% upper of Tension N
Tmin=10;% lower of Tension N
a=1.25;% x y dimentions of cable robot m
% For only one pose
Ax=0;Ay=0;Az=0;
T=Tension_Spatial_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass);
% [T,error]=Tension_Spatial_CableRobotNew(Tmin,Tmax,Ax,Ay,Az,a); % calculate the tension distribution
[f2,K,M,nodeCoordinates,elementNodes]=FEM_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a);
f2=f2*0.16;
f2=sort(real(f2));
a=490;
b=500;
beta=linspace(1,50,a);
FF=linspace(1500,3000,b);
Ampli=zeros(a,b);
for i=1:length(FF);
F0=-FF(i);
Ampli(:,i)=Steady_State_Response(f2,K,M,F0,beta);
end
[X Y]=meshgrid(FF,beta);
plot3(beta,FF,Ampli);
% hold on;grid on
% XY=load('SAP2000_F1500_1_50_Hz.txt');
% plot(XY(:,1),XY(:,2)*1e3,'--red','LineWidth',2);
% ylabel('Z displacement of the end effector (mm)','FontSize',12,'FontWeight','bold','Color','b')
% xlabel('\omega (Hz)','FontSize',12,'FontWeight','bold','Color','b')
% legend('Present-FEM','SAP2000','FontSize',12,'FontWeight','bold')

