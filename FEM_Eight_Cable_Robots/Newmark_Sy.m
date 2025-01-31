function [t,displacement,velocity,acceleration]=Newmark_Sy(K,M,C,tmin,tmax,FF,dt,omega)
%========DAMPING MATRIX=========
DOF = size(K);
DOF=DOF(1); % Degree of freedom
%======== Time Step =========
number=(tmax-tmin)/dt;
t=linspace(tmax,tmin,number);
% initial U,  Udot and  Forces matrices
displacement = zeros(DOF,number); velocity = zeros(DOF,number);
acceleration = zeros(DOF,number); Force = zeros(DOF,number);
% Initial accelerations
acceleration(:,1) = M\([zeros(DOF(1)-3,1);0;0;FF*sin(t(1)*(2*pi*omega))]-C*velocity(:,1)-K*displacement(:,1));
% Select time step dt and parameters beta and alpha calculate integration constants:
beta = 0.25 ;alpha = 0.5 ;
a0 = 1/(beta*dt^2) ; a1 = alpha/(beta*dt) ; a2 = 1/(beta*dt) ;
a3 = 1/(2*beta)-1 ; a4 = alpha/beta-1 ;a5 = (dt/2)*(alpha/beta-2) ;
a6 = dt*(1-alpha) ; a7 = alpha*dt ;
% Effective stiffness matrix
Ke = K+a0*M+a1*C ;
% For each time step
for i = 1:number-1
    % 1. Calculate effective loads at time t + dt
    Force(:,i+1) = [zeros(DOF(1)-3,1);0;0;FF*sin(t(i)*(2*pi*omega))]+M*(a0*displacement(:,i)+a2*velocity(:,i)+a3*acceleration(:,i))+C*(a1*displacement(:,i)+a4*velocity(:,i)+a5*acceleration(:,i));
    % 2. Solve for displacements at time t+dt
    displacement(:,i+1)= Ke\Force(:,i+1);
    % 3. Calculate accelerations and velocities at time t + dt
    acceleration(:,i+1) = a0*(displacement(:,i+1)-displacement(:,i))-a2*velocity(:,i)-a3*acceleration(:,i) ;
    velocity(:,i+1) = velocity(:,i)+a6*acceleration(:,i)+a7*acceleration(:,i+1);
end
end

