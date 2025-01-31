clc;clear all;close all
E=2.01e10; % Young's modulus : 113Gpa
A=4^2*pi*10^-6;% cross section are m^2
w=0.251; % weight per unit length 0.067 kg/m 15e3 N
n=20;
mass=30;
Tmax=1000;   % upper of Tension N
Tmin=60;    % lower of Tension N
a=1.25;% x y dimentions of cable robot m
b=2.5;
T=10;
n1=200;
t=linspace(0,10,n1);
r=0.75;
x=r*cos(2*pi*(t/T));x=x';
y=r*sin(2*pi*(t/T));y=y';
Az=1.25;
for i=1:n1
    Tmin=80;
    Ax=x(i);
    Ay=y(i);
    T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
    [f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
    W1(i)=min(f2);    
end
Tmin=100;% lower of Tension N
for i=1:n1
    Ax=x(i);
    Ay=y(i);
    T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b);
    [f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass);
    W2(i)=min(f2);
end
figure()
plot3(x,y,W1,'--r','LineWidth',1.5); % TMIN=60N
hold on
plot3(x,y,W2,'-b','LineWidth',1.5);% TMIN=80N
grid on
ylabel('x [m]','FontSize',12,'FontWeight','bold','Color','k')
xlabel('y [m]','FontSize',12,'FontWeight','bold','Color','k')
zlabel('The first natural frequency [Hz]','FontSize',12,'FontWeight','bold','Color','k')
legend('Tmin=80N','Tmin=100N')
figure()
plot3(x,y,Az*ones(length(x),1),'LineWidth',1.5); 
ylabel('x [m]','FontSize',12,'FontWeight','bold','Color','k')
xlabel('y [m]','FontSize',12,'FontWeight','bold','Color','k')
zlabel('z [m]','FontSize',12,'FontWeight','bold','Color','k')
grid on
