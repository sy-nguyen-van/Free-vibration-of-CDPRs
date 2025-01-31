function F=Impulse_Analytical(Fi,t)
if t<10
    F=Fi*cos(4*t);
elseif t>=10
    F=0;
end
end