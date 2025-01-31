% step 4
function [lx,ly,lz]=projectedlength(F1,F2,F3,L0,w,E,A)
lnxy1=sqrt(F1^2+F2^2+(w*L0-F3)^2)+w*L0-F3;
lnxy2=sqrt(F1^2+F2^2+F3^2)-F3;
lnz=sqrt(F1^2+F2^2+(w*L0-F3)^2)-sqrt(F1^2+F2^2+F3^2);
% equation (6 a b c)
% if F1==0 & F2==0;
%     lx=0;
%     ly=0;
%     lz=-(F3*L0/E/A)+w*L0^2/2/E/A+(1/w)*lnz    
% else
    lx=-(F1*L0/E/A)-(F1/w)*(log(lnxy1)-log(lnxy2));
    ly=-(F2*L0/E/A)-(F2/w)*(log(lnxy1)-log(lnxy2));
    lz=-(F3*L0/E/A)+(w*L0^2)/2/E/A+(1/w)*lnz;
% end
end