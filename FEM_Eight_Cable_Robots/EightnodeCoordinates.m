function nodeCoordinates=EightnodeCoordinates(a,b,Ax,Ay,Az,n)
    nodeCoordinates=[[(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (b:-(b-Az)/n:b+((n-1)*-(b-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (b:-(b-Az)/n:b+((n-1)*-(b-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (b:-(b-Az)/n:b+((n-1)*-(b-Az)/n))']
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (b:-(b-Az)/n:b+((n-1)*-(b-Az)/n))']
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', Az*ones(1,n)']          %
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', Az*ones(1,n)']      %
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', Az*ones(1,n)']  %
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', Az*ones(1,n)']      %
    [Ax,Ay,Az]];
end