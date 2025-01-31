function Po=Node(c,n,Ai)
if Ai==0
    Po=zeros(n,1);
else
    Po=(c:-(c-Ai)/n:c+((n-1)*-(c-Ai)/n))';
end
end
