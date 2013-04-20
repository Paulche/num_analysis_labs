function [dir_y dir_x rev_y rev_x] = simple_square()

  [x y] = linput;

  x_ten = x(1:10);
  y_ten = y(1:10);

  % y against x
  [dir_y dir_x] = min_square(y_ten, x_ten);

  % x against y
  [rev_y rev_x] = min_square(x_ten, y_ten);
end
