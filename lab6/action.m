function action
  % 1. Interpolation Runge against by uniform       points
  % 2. Interpolation Runge against by Chebyshev's   points
  %
  % 3. Draw plot for 1. and 2. against exact Runge-function (on at least 100 point)
  % 4. Interpolate function y = 0.5x^2 + 8x^-1 + 8, a = -4, b = -1
  %      for n = {11,6}
  % 5. Interpolate by Matlab
  % 6. Compute errors vectors
  % 7. Draw plots

  % Runge plot
  uniform_source  = -1:2/10:1;
  cheb_source     = cheb(-1,1,11);
  x               = -1:2/100:1;

  uniform_value   = runge(uniform_source);
  cheb_value      = runge(cheb_source);

  uniform_y = arrayfun(@(x)( ipol_lagr(uniform_source,uniform_value,x) ),x);
  cheb_y    = arrayfun(@(x)( ipol_lagr(cheb_source,cheb_value,x) ),x);
  runge_y   = runge(x);

  subplot(3,1,1);
  runge_plot = [uniform_y; cheb_y; runge_y];
  H = plot(x, runge_plot);
  legend('Uniform','Cheb','Exact');

  % Task plot
  x = -4:5/100:-1;
  f = @(x)(0.5*x.^2 + 8*x.^-1 + 8);
  source_n6 = -4:5/6:-1;
  source_n11 = -4:5/11:-1;

  value_n6  = f(source_n6);
  value_n11 = f(source_n11);

  y_n6  = arrayfun(@(x)( ipol_lagr(source_n6,value_n6,x) ),x);
  y_n11 = arrayfun(@(x)( ipol_lagr(source_n11,value_n11,x) ),x);

  a_n6  = polyfit(source_n6, value_n6, 6);
  a_n11 = polyfit(source_n11, value_n11, 11);

  y_n6m  = arrayfun(@(x)( polyval(a_n6,x)), x);
  y_n11m = arrayfun(@(x)( polyval(a_n11,x)), x);

  y_plot = [y_n6; y_n11; y_n6m; y_n11m];

  subplot(3,1,2);
  plot(x, y_plot);
  legend('y_n6','y_n11','y_n6m','y_n11m');

  % Error plot
  y_n6_e = abs(y_n6 - y_n6m)
  y_n11_e = abs(y_n11 - y_n11m)

  y_error = [y_n6_e; y_n11_e]

  subplot(3,1,3);
  plot(x, y_error);
  legend('y_n6_error','y_n11_error');
end
