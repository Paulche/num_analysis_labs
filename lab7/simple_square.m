function [r_y x_ten] = simple_square()
  [x y] = linput;

  x_ten = x(1:10);
  y_ten = y(1:10);

  x_mean = mean(x_ten);
  y_mean = mean(y_ten);

  b_one = sum((x_ten - x_mean).*(y_ten- y_mean)) / std(x_ten);

  b_zero = y_mean - b_one * x_mean;

  r_y = b_zero + b_one * x_ten;
end
