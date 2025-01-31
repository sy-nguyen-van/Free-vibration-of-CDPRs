clc;clear all;close all
E=1.92e10; % % Young's modulus : 113Gpa
A=2^2*pi*10^-6;% cross section are m^2
w=5.0031e3*A; %% weight per unit length 0.067 kg/m 15e3 N
n=40;% number of elements per a cable
mass=30;
Tmax=350;% upper of Tension N
Tmin=40; % lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
n1=100;
t=linspace(0,10,n1);
r=0.75;
x=r*cos(t);
y=r*sin(t);
Az=1.25;
for i=1:n1
    Ax=x(i);
    Ay=y(i);
    T=Tension_5_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,b,mass);
    [f2,K,M]=Frequency_5_CableRobot(A,E,w,n,T,Ax,Ay,Az,a,b);
    W1(i)=min(f2);
    T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
    [f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b);
    W2(i)=min(f2);
end
plot3(x,y,W1,'--r','LineWidth',1.5); % TMIN=40N
hold on
plot3(x,y,W2,'-b','LineWidth',1.5); % TMIN=40N
xlabel('x axis');
ylabel('y axis');
zlabel('The 1st natural frequency (Hz)');
grid on;



