function y = runge()
  [f cond h domain] = linput();

  prev = cond(2);

  y = [prev];

  for i = domain(1):h:domain(2)
    k1 = f(i,prev);
    k2 = f(i + h/2,prev + k1/2);
    k3 = f(i + h/2,prev + k2/2);
    k4 = f(i + h, prev + k3);

    prev = prev + (h * (k1 + 2*k2 + 2*k3 + k4))/6;
    y = [y prev];
  end
end
