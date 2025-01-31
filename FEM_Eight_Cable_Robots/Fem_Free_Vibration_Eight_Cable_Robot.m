clc;clear all;close all
E=2.01e10; % Young's modulus : 113Gpa
A=4^2*pi*10^-6;% cross section are m^2
w=0.251; % weight per unit length 0.067 kg/m 15e3 N
n=40;
mass=30;
Tmax=1000;   % upper of Tension N
Tmin=80;    % lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
Case=1;
% For only one pose
if Case==0
    Ax=0;Ay=0;Az=1.25;
T=Tension_Eight_CableRobot_Closed_Form(T1,T2,Ax,Ay,Az,a,mass,b)
[f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
    f2=real(f2);
    f2=(f2(1:10))
    
else
    dx=0.25;dy=dx;dz=dx;
    n1=50;
    x=linspace(-a+dx,a-dx,n1);
    y=linspace(-a+dy,a-dy,n1);
    z=linspace(dz,b-dz,n1);
    W=zeros(n1,n1,n1);
    for i=1:n1
        Ax=x(i);
        for j=1:n1
            Ay=y(j);
            for k=1:n1
                Az=z(k);
T=Tension_Eight_CableRobot_Closed_Form(T1,T2,Ax,Ay,Az,a,mass,b)
[f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
                W(i,j,k)=min(f2);
            end
        end
    end
    W=real(W);
    [X,Y,Z] = meshgrid(x,y,z);
    figure()
    contourslice(X,Y,Z,W,x,y,z);% plot the natural frequency for all poses of the end-effector;
    grid on; 
    xlabel('x axis');
    ylabel('y axis'); 
    zlabel('z axis');
    h= colorbar;
    title(h,'Hz');
end