function T=Tension_Eight_CableRobot_Qua(Tmin,Tmax,Ax,Ay,Az,a,mass,b)
eps=10^-3;
g=9.81;% gravity
A1=[a,a,b]';
A2=[-a,a,b]';
A3=[-a,-a,b]';
A4=[a,-a,b]';
%%%%%
B1=[a,a,Az]';
B2=[-a,a,Az]';
B3=[-a,-a,Az]';
B4=[a,-a,Az]';
E=[Ax,Ay,Az]';
%%%%%
V1=A1-E;V2=A2-E;V3=A3-E;V4=A4-E;
VV1=B1-E;VV2=B2-E;VV3=B3-E;VV4=B4-E;
OR1=V1/norm(V1);OR2=V2/norm(V2);
OR3=V3/norm(V3);OR4=V4/norm(V4);
ORR1=VV1/norm(VV1);ORR2=VV2/norm(VV2);
ORR3=VV3/norm(VV3);ORR4=VV4/norm(VV4);
R=[OR1,OR2,OR3,OR4,ORR1,ORR2,ORR3,ORR4];
A=[];B=[];
H=ones(8,8);f=zeros(8,1);
lb=Tmin*ones(1,8)';
ub=Tmax*ones(1,8)';
Beq=[eps,eps,mass*g-eps]';
T=quadprog(H,f,A,B,R,Beq,lb,ub);
end