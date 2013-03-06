function r = iter(A,b,x)
  %
  % x = B*x + c
  %

  len = length(A);

  B = zeros(len);
  c = b ./ diag(A);

  for i = 1:len
    B(i,:) = - A(i,:) / A(i,i);
    B(i,i) = 0;
  end

  r = B * x + c;
end
