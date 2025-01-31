function [f2,K1,M1,nodeCoordinates,elementNodes]=FEM_Frequency_Eight_CableRobot(E,w,A,n,T,Ax,Ay,Az,a,b,mass)
% generation of coordinates and connectivities
g=9.81;
nodeCoordinates=EightnodeCoordinates(a,b,Ax,Ay,Az,n);
% Creat the element node matrix ==> important
l=size(nodeCoordinates,1);
m=size(nodeCoordinates,1)-1;
elementNodes=zeros(m,2);
for i = 1:m
    elementNodes(i,:) = [i i+1];
    if n==i||(2*n)==i||(3*n)==i||(4*n)==i||5*n==i||(6*n)==i||(7*n)==i||(8*n)==i;
        elementNodes(i,2)= l;
    end
end
elementNumbers=size(elementNodes,1);
nodeNumbers=size(nodeCoordinates,1);
% displacements: displacement vector
% force : force vector
% stiffness: stiffness matrix
% GDof: global number of degrees of freedom
Dof=3*nodeNumbers;
U=zeros(Dof,1);
force=zeros(Dof,1);
% applied load at node 2
% stiffness matrix
stiffness=zeros(Dof);
M=zeros(Dof);
% computation of the system STIFFNESS matrix and the system MASS matrix
I=eye(3,3);
for e=1:elementNumbers;
    % elementDof: element degrees of freedom (Dof)
    indice=elementNodes(e,:);
    elementDof=[3*indice(1)-2, 3*indice(1)-1, 3*indice(1), 3*indice(2)-2, 3*indice(2)-1, 3*indice(2)] ;
    x1=nodeCoordinates(indice(1),1);y1=nodeCoordinates(indice(1),2);z1=nodeCoordinates(indice(1),3);
    x2=nodeCoordinates(indice(2),1);y2=nodeCoordinates(indice(2),2);z2=nodeCoordinates(indice(2),3);
    L = sqrt((x2-x1)^2 + (y2-y1)^2 +(z2-z1)^2);
    CXx = (x2-x1)/L; CYx = (y2-y1)/L;CZx = (z2-z1)/L;
    Cosin = [CXx*CXx, CXx*CYx, CXx*CZx ; CYx*CXx, CYx*CYx, CYx*CZx ; CZx*CXx, CZx*CYx, CZx*CZx];
    if e<n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(1))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(1)/L)*[I, -I;-I, I];
    elseif n+1<=e & e<2*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(2))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(2)/L)*[I, -I;-I, I];
    elseif 2*n+1<=e & e<3*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(3))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(3)/L)*[I, -I;-I, I];
    elseif 3*n+1<=e & e<4*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(4))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(4)/L)*[I, -I;-I, I];
        
    elseif 4*n+1<=e & e<5*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(5))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(5)/L)*[I, -I;-I, I];
    elseif 5*n+1<=e & e<6*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(6))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(6)/L)*[I, -I;-I, I];
    elseif 6*n+1<=e & e<7*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(7))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(7)/L)*[I, -I;-I, I];
    else 7*n+1<=e & e<8*n+1;
        %         indice
        stiffness(elementDof,elementDof)= stiffness(elementDof,elementDof)+((E*A-T(8))/L)*[Cosin, -Cosin ;-Cosin, Cosin]+(T(8)/L)*[I, -I;-I, I];
    end
    M(elementDof,elementDof)= M(elementDof,elementDof)+(w*L/(6*g))*[2*I, I;I, 2*I];
end
% mass(8*n,8*n)=mass(8*n,8*n)+20;
fix=[1, n+1, 2*n+1, 3*n+1,4*n+1,5*n+1, 6*n+1, 7*n+1];
all=1:nodeNumbers;
free=setdiff(all,fix);
k=size(free,2)*3;
Fdof =zeros(1,k);
for i=1:k/3;
    Fdof(3*i-2)=3*free(i)-2;
    Fdof(3*i-1)=3*free(i)-1;
    Fdof(3*i)=3*free(i);
end
M(end,end)=M(end,end)+mass;
M(end-1,end-1)=M(end-1,end-1)+mass;
M(end-2,end-2)=M(end-2,end-2)+mass;
K=stiffness;
M1=M(Fdof,Fdof);
K1=K(Fdof,Fdof);
D = inv(M1)*K1;
w= eig(D);
f2=sort(sqrt(w))*0.16;
end