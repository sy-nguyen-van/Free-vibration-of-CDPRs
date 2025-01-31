%step 5
function [dL]=deltaL(lx0,ly0,lz0,lx,ly,lz)
dL=[lx0;ly0;lz0]-[lx;ly;lz];
end