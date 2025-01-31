function Ampli=Steady_State_Response(f2,K,M,F0,beta)
nn=size(K);
nn=nn(1);
F=zeros(nn,1);
F(end)=F0;
for i=1:length(beta)
    alpha=beta(i)/0.16;
    d=(K-((alpha^2)*M))\F;  
    Ampli(i)=d(end);    
end
end
