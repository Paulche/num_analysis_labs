function r = poly(x,y,n)
  A = [];

  for i = 1:length(x)
    A(i,1) = 1;

    for j = 2:n
      A(i,j) = x(i)^(j-1);
    end
  end

  b = ((A'*A)^-1*A')*y';

  for i = 1:length(x)
    t = b(1);

    for j = 2:n
      t = t + b(j)*x(i)^(j-1);
    end

    r(i) = t;
  end
end
