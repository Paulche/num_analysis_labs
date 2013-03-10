function [solution conv serial] = iter_method(A,b,x,n)
  r = x;
  serial = transp(x);

  [B c] = compute_bc(A,b);

  % Check convergency
  if norm(B) < 1
    conv = true;
  else
    conv = false;
  end

  for i = 1:n
    x = B * x + c;
    serial = [serial; transp(x)];
  end

  solution = x;
end
