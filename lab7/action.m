function action()
  [x y] = linput();

  delete(findall(0,'Type','Figure'));

  % First part
  [simple_y simple_x] = simple_square();

  subplot(3,1,1);
  plot_x = [x(1:10); simple_x]';
  plot_y = [y(1:10); simple_y]';

  plot(plot_x,plot_y);
  legend('Exact','Approx');

  simple_mean       = mean(simple_y)
  simple_median     = median(simple_y)

  simple_std        = std(simple_y)
  simple_std_s      = std(simple_y, 1)

  corr              = corrcoef(simple_y)

  % Second part
  [x y] = linput();

  straight_x = x;
  straight_y = poly(x,y);

  reverse_x = y;
  reverse_y = poly(y,x);

  % Draw plots
  subplot(3,1,2);
  plot_x = [x; straight_x; reverse_x]';
  plot_y = [y; straight_y; reverse_y]';
  plot(plot_x,plot_y);
  legend('Variable', 'Straight', 'Reverse');

  straight_p = polyfit(x,y,7);
  reverse_p = polyfit(y,x,7);

  m_straight_y = mapprox(x,straight_p);
  m_reverse_y = mapprox(y,reverse_p);

  plot_x = [x; x; y]';
  plot_y = [y; m_straight_y; m_reverse_y]';

  subplot(3,1,3);
  plot(plot_x,plot_y);
  legend('Variable', 'Straight', 'Reverse');
end
