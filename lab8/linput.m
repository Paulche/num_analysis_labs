function [f cond h domain] = linput()
  f = @(t,u) (u + (u^2 + t^2)^0.5)/t;
  cond = [0 1];
  h = 0.02;
  domain = [1 1.5];
end
