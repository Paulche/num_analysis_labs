function [solution conv serial] = seidel_method(A,b,x,n)
  serial = x';
  len = length(x);

  [B c] = compute_bc(A, b);

  Bl = tril(B);
  Bu = triu(B);

  norm_B = norm(Bl) + norm(Bu);

  if norm_B < 1
    conv = true;
  else
    conv = false;
  end

  for iter = 1:n
    for i = 1:len
      x(i) = (b(i) - sum(A(i,1:i-1)*x(1:i-1)) - sum(A(i,i+1:end)*x(i+1:end))) / A(i,i);
    end
    serial = [ serial; x' ];
  end

  solution = x;
end
