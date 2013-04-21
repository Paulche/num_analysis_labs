function [n c x t dh dt ot u1 u2 u3 u4 f] = linput()

  %
  % u'tt  = u'xx + 2*sin(x)^2
  % x = 0..pi
  % u(0,t) = u'x(pi,t) = 0
  % u(x,0) = u't(x,0) = 0
  %
  n = 50;
  c = 1;
  x = [0 pi];
  t = [0 1];
  dh = (x(2) - x(1)) / n;
  dt = (t(2) - t(1)) / n;

  ot = (c^2 * dt^2) / dh^2;

  u1  = @(x) 0;
  u2  = @(x) 0;
  u3  = @(x) 0;
  u4  = @(x) 0;

  f = @(n) 2*sin(x(1) + dh*n)^2;
end
