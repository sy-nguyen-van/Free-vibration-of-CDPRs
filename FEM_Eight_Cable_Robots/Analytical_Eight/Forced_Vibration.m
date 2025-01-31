clear all;clc;close all
esp=1e-2;
E=1.92e10; % % Young's modulus : 113Gpa
A=2^2*pi*10^-6;% cross section are m^2 
w=5.0031e3*A; %% weight per unit length 0.067 kg/m 15e3 N 
n=3;% number of elements per a cable
mass=5;
Tmax=150;% upper of Tension N
Tmin=10; % lower of Tension N
a=1.25;% x y dimentions of cable robot m
% For only one pose
Ax=0;Ay=0;Az=0;
T=Tension_Spatial_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass);
[f2,K,M,nodeCoordinates,elementNodes]=Analytical_Frequency_Spatial_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,esp);
f2;
% DOF = size(K);   DOF=DOF(1); % Degree of freedom   
% aa=[(1/f2)' (1/f2.^2)' (1/f2.^3)']\(2*0.05*ones(DOF,1))
% for i=1:DOF
%    mk=inv(M)*K;
%    C=C+M*(aa(i)*mk.^(i-1)) 
% end
%  
% ab=[1 f2(1)^2;1 f2(2)^2]\[2*0.05*f2(1);2*0.05*f2(2)];
% C =0.01498*M+0.001405*K;
% C =ab(1)*M+ab(2)*K;
DOF = size(K);  C=zeros(DOF); 
DOF=DOF(1); % Degree of freedom     
tmin = 0 ;     % initial time step
tmax = 10 ;   % final time step
% T=real(1/f2(12));
% dt = T/10;   % size of the time step
dt=0.02;
number = round((tmax-tmin)/dt,0);
t = linspace(tmin,tmax,number); % time
F0 =-10; % amplitude of force
% initial displacement, initial velocity and  acceleration matrices
displacement = zeros(DOF,number); velocity = zeros(DOF,number);
acceleration = zeros(DOF,number); F=[zeros(DOF(1)-3,1);0;0;F0];
R = zeros(DOF,number);
% Initial accelerations
acceleration(:,1) = inv(M)*(F-C*velocity(:,1)-K*displacement(:,1));
% Select time step dt and parameters alpha and delta calculate integration constants:
alpha = 0.25 ;delta = 0.5 ;
a0 = 1/(alpha*dt^2) ; a1 = delta/(alpha*dt) ; a2 = 1/(alpha*dt) ;
a3 = 1/(2*alpha)-1 ; a4 = delta/alpha-1 ;a5 = (dt/2)*(delta/alpha-2) ;
a6 = dt*(1-delta) ; a7 = delta*dt ;
% Effective stiffness matrix
Ke = K+a0*M+a1*C ;
% For each time step
for i = 1:number-1
    % 1. Calculate effective loads at time t + dt
    R(:,i+1) = F+M*(a0*displacement(:,i)+a2*velocity(:,i)+a3*acceleration(:,i))+C*(a1*displacement(:,i)+a4*velocity(:,i)+a5*acceleration(:,i));
    % 2. Solve for displacements at time t+dt
    displacement(:,i+1)= Ke\R(:,i+1);
    % 3. Calculate accelerations and velocities at time t + dt
    acceleration(:,i+1) = a0*(displacement(:,i+1)-displacement(:,i))-a2*velocity(:,i)-a3*acceleration(:,i) ;
    velocity(:,i+1) = velocity(:,i)+a6*acceleration(:,i)+a7*acceleration(:,i+1);
end
displacement=displacement*10^3;
subplot(3,1,1);
plot(t,displacement(DOF(1)-2,:));% z displacement
ylabel('x displacement   	 mm');
grid on;
subplot(3,1,2);
plot(t,displacement(DOF(1)-1,:));% y displacement
ylabel('y displacement   	 mm');
grid on;
subplot(3,1,3);
plot(t,displacement(DOF(1),:));% x displacement
ylabel('z displacement   	 mm');
xlabel('time');
grid on;