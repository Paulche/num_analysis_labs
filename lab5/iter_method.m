function [solution serial] = iter_method(A,b,x,n)
  r = x;
  serial = [];
  serial(1,:) = x;

  [B c] = iter(A,b);

  for i = 1:n
    r = B * x + c;
    serial(i+1,:) = r;
  end

  solution = r;
end
