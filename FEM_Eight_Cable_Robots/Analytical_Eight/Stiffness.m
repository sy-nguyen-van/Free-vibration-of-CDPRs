% Interation for calculating stiffness matrix
%step 1
function K=Stiffness(E,A,w,I,J)
lx0=xj-xi;ly0=yj-yi;lz0=zj-zi;
L0=sqrt(lx0^2+ly0^2+lz0^2);
F1=-lx0*T0/L0;
F2=-ly0*T0/L0;
F3=-lz0*T0/L0;
end