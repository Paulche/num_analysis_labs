function xo = cheb(a,b,n)
  xo = [];
  for i = 0:n-1
    r = (a + b)/2 + (b-a)/2*cos(((2*i +1)*pi)/(2*(n-1)+2));
    xo = [xo r];
  end
end
