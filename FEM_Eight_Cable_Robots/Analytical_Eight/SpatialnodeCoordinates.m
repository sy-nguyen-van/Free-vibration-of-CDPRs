function nodeCoordinates=SpatialnodeCoordinates(a,Ax,Ay,Az,n)
nodeCoordinates=[[(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (a:-(a-Az)/n:a+((n-1)*-(a-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (a:-(a-Az)/n:a+((n-1)*-(a-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (a:-(a-Az)/n:a+((n-1)*-(a-Az)/n))']
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (a:-(a-Az)/n:a+((n-1)*-(a-Az)/n))']
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (-a:-(-a-Az)/n:-a+((n-1)*-(-a-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (a:-(a-Ay)/n:a+((n-1)*-(a-Ay)/n))', (-a:-(-a-Az)/n:-a+((n-1)*-(-a-Az)/n))']
    [(-a:-(-a-Ax)/n:-a+((n-1)*-(-a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (-a:-(-a-Az)/n:-a+((n-1)*-(-a-Az)/n))']
    [(a:-(a-Ax)/n:a+((n-1)*-(a-Ax)/n))', (-a:-(-a-Ay)/n:-a+((n-1)*-(-a-Ay)/n))', (-a:-(-a-Az)/n:-a+((n-1)*-(-a-Az)/n))']
    [Ax,Ay,Az]];
end