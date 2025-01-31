function [F1,F2,F3]=Gamma(lx,ly,lz,L0,w)
if (lx^2+ly^2)==0
    gama0=10^6;
elseif (L0^2-lx^2-ly^2-lz^2)<=0
    gama0=0.2;
elseif (L0^2-lx^2-ly^2-lz^2)>0
    Num=(L0^2-lz^2);
    Dem=(lx^2+ly^2);
    gama0=sqrt(3*Num/Dem-3);
end
F1=(-w*lx)/(2*gama0)
F2=(-w*ly)/(2*gama0)
F3=(w/2)*(-lz*cosh(gama0)/sinh(gama0)+L0)
end