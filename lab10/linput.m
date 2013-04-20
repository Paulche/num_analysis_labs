function [] = linput()
  c = 4;
  a = 2;
  T = 4;
  nx = 50;
  nt = 50;
  t = T/nt;
  h = a/nx;

  u(1) = @(x) sin(pi * x) + 3*sin(2.5*pi*x);
  u(2) = u(3) = u(4) = @(x) 0;
end
