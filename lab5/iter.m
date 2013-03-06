function [B c] = iter(A,b)
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

end
