function [solution serial] = iter_method(A,b,x,n)
  r = x;
  serial = [];
  serial(1,:) = x;

  [B c] = iter(A,b);

  for i = 1:n
    x = B * x + c;
    serial(i+1,:) = x;
  end

  solution = x;
end
