function [K,L0]=TangentStiffness(E,A,w,I,J,T0)
% step 1+2
xi=I(1);yi=I(2);zi=I(3);
xj=J(1);yj=J(2);zj=J(3);
%step 2
% equation (21)
lx0=xj-xi;
ly0=yj-yi;
lz0=zj-zi;
L0=sqrt(lx0^2+ly0^2+lz0^2);
% step 3
[F1,F2,F3]=intialization(T0,L0,lx0,ly0,lz0);
% step 4
% STEP 5 & 6
Ti=(F1^2+F2^2+F3^2)^(0.5);
F4=-F1;F5=-F2;F6=-F3+w*L0;
Tj=(F4^2+F5^2+F6^2)^(0.5);
f11=(F1^2/w)*(1/(Ti*(Ti-F3))-1/(Tj*(Tj+F6)))-L0/E/A-log((Tj+F6)/(Ti-F3))/w;
f12=(1/(Ti*(Ti-F3))-1/(Tj*(Tj+F6)))*(F1*F2/w);
f21=f12;
f13=F1*(1/Tj-1/Ti)/w;f31=f13;
f22=(F2^2/w)*(1/(Ti*(Ti-F3))-1/(Tj*(Tj+F6)))-L0/E/A-log((Tj+F6)/(Ti-F3))/w;
f33=-L0/E/A-(F6/Tj+F3/Ti)/w;
f23=F2*(1/Tj-1/Ti)/w;f32=f23;
F=[f11 f12 f13;
    f21 f22 f23;
    f31 f32 f33];
K1=inv(F);
K=[-K1,K1;
    K1,-K1];
end


