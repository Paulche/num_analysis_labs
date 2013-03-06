function [solution serial] = iter_method(A,b,x,n)
  r = x;
  serial = [];
  serial(1,:) = x;

  for i = 1:n
    r = iter(A,b,r);
    serial(i+1,:) = r;
  end

  solution = r;
end
