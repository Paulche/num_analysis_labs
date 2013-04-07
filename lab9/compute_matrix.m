function [a b c F M] = compute_matrix()
  [x p q k a b t n f] = linput;

  a = [];
  b = [k(1) - k(2)/t];
  c = [k(2)/t];

  b(n+1) = k(3) - k(4)/t;
  a(n+1) = - k(4) / t;

  for i = 1:(n-1)
    i_e = i+1;

    q_v = q(x(1) + i * t);
    p_v = p(x(1) + i * t);

    a(i_e) = t^-2 - p_v / (2*t);
    b(i_e) = q_v - 2*t^-2;
    c(i_e) = t^-2 + p_v / (2*t);
  end

  for i = 1:(n+1)
    F(i,1) = f(x(1) + (i-1)*t);
  end

  M(1,1) = b(1);
  M(1,2) = c(1);

  M(n+1,n) = a(n+1);
  M(n+1,n+1) = b(n+1);

  for i = 2:n
    M(i,i-1)  = a(i-1);
    M(i,i)    = b(i-1);
    M(i,i+1)  = c(i-1);
  end
end
