clc;clear all;close all
esp=1e-3;
E=2.01e10; % Young's modulus : 113Gpa
A=4^2*pi*10^-6;% cross section are m^2
w=0.251; % weight per unit length 0.067 kg/m 15e3 N
n=40;
mass=30;
Tmax=1000;   % upper of Tension N
Tmin=120;    % lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
% For only one pose
Ax=0;Ay=0;Az=1.25;
T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
[f2,K1,M1,nodeCoordinates,elementNodes]=Analytical_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,esp,b,mass);
f2=real(sort(f2));
f2=f2(1:10);
min(f2)
% for all poses
% dx=0.25;dy=dx;dz=dx;
% n1=50;
% x=linspace(-a+dx,a-dx,n1);
% y=linspace(-a+dy,a-dy,n1);
% z=linspace(-a+dy,a-dy,n1);
% W=zeros(n1,n1,n1);
% for i=1:n1
%     Ax=x(i);
%     for j=1:n1
%         Ay=y(j);
%         for k=1:n1
%             Az=z(k);
%             %position of end effector
%             % [T,error]=Tension_Spatial_CableRobot_New(Tmin,Tmax,Ax,Ay,Az,a); % calculate the tension distribution
%             T=Tension_Spatial_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass);
%             [f2,K1,M1,nodeCoordinates,elementNodes]=Analytical_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,esp);
%             W(i,j,k)=min(f2);
%         end
%     end
% end
% W=real(W);
% [X,Y,Z] = meshgrid(x,y,z);
% contourslice(X,Y,Z,W,x,y,z);% plot the natural frequency for all poses of the end-effector;
% grid on; xlabel('x axis'); ylabel('y axis'); zlabel('z axis');
% h= colorbar;
% title(h,'Hz');

