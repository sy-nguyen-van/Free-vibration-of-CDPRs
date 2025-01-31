function [F1,F2,F3]=IterativeMatrix(C,dL,F1,F2,F3)
     dC=inv(C)*dL;
     F1=F1+dC(1);
     F2=F2+dC(2);
     F3=F3+dC(3)
end