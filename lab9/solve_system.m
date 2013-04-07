function Y = solve_system(a,b,c,F)
  n = length(a) - 1;

  Ap = [-c(1)/b(1)];
  Bp = [F(1)/b(1)];

  try_a(Ap(1));

  for i = 2:n
    Ap(i) = - c(i) / (a(i) * Ap(i-1) + b(i));

    try_a(Ap(i));

    Bp(i) = (F(i) - a(i) * Bp(i-1))/(a(i) * Ap(i-1) + b(i));
  end


  Y(n+1) = (F(n+1) - a(n+1)*Bp(n))/(a(n+1)*Ap(n) + b(n+1));

  for i = n:-1:1
    Y(i) = Ap(i) * Y(i+1) + Bp(i);
  end
end
