function r = poly(x,y)
  A = [];

  for i = 1:length(x)
    A(i,:) = [1 x(i)^3 x(i)^5 x(i)^7];
  end

  b = ((A'*A)^-1*A')*y';
  r = b(1) + b(2)*x.^3 + b(3)*x.^5 + b(4)*x.^7;
end
