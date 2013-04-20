function action
  %
  % Here is the task:
  %   1. Numeric solve diff equation by Euler
  %   2. Numeric solve diff equation by Runge-Kutta
  %   3. Numeric solve diff equation by Matlab build-in function
  %   4. Draw three plot and compare them
  %
  [f cond h domain] = linput();

  x = domain(1):h:domain(2)+h;

  %   1.
  euler_y = euler();

  %   2.
  runge_y = runge();

  %   3.
  [mat_x mat_y] = ode45(f,domain,cond(2))

  %   4.
  plot_y = [euler_y; runge_y];

  subplot(2,1,1);
  plot(x,plot_y);
  legend('Euler','Runge');

  subplot(2,1,2);
  plot(mat_x, mat_y);
end
