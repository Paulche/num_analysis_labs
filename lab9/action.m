function [M F] = action()
  [x p q k a b t n f] = linput;

  [a b c F M] = compute_matrix;

  Y = solve_system(a,b,c,F);

  plot_x = x(1):t:x(2);

  plot(plot_x,Y);
end
