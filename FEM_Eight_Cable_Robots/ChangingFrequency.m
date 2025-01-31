clc;clear all;close all
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
tmin=0;tmax=0.5;
dt=0.001;
FF=-1500;
omega=[5,10,15];% External Frequency
for i=1:length(omega)
    [t,UU,Udot,U2dot]=Newmark_Sy(K,M,C,tmin,tmax,FF,dt,omega(i));
    %=====PLOT==============================
    U(i,:)=UU(index,:);
end
plot(t,U(1,:)*1e3,'-b','LineWidth',2.5);%  U
hold on
plot(t,U(2,:)*1e3,'-.g','LineWidth',2.5);%  U
hold on
plot(t,U(3,:)*1e3,'--r','LineWidth',2.5);%  U
ylabel('Displacement [mm]','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Time [s]','FontSize',12,'FontWeight','bold','Color','k')
grid on
legend('f_c=5 [Hz]','f_c=10 [Hz]','f_c=15 [Hz]','FontSize',12,'FontWeight','bold')
ylim([-10 10])
figure()
for i=1:length(omega)
    Force(i,:)=FF*sin(t*2*pi*omega(i));
end
plot(t,Force(1,:)*1e3,'-b','LineWidth',2.5);%  U
hold on
plot(t,Force(2,:)*1e3,'-.g','LineWidth',2.5);%  U
hold on
plot(t,Force(3,:)*1e3,'--r','LineWidth',2.5);%  U
ylabel('Force [N]','FontSize',12,'FontWeight','bold','Color','k')
xlabel('Time [s]','FontSize',12,'FontWeight','bold','Color','k')
grid on
legend('f_c=5 [Hz]','f_c=10 [Hz]','f_c=15 [Hz]','FontSize',12,'FontWeight','bold')
ylim([-1.6e6 2.5e6])
