function y = euler()
  [f cond h domain] = linput();

  prev = cond(2);

  y = [prev];

  for i = domain(1):h:domain(2)
    prev = prev + h * f(i,prev);
    y = [y prev];
  end

end
