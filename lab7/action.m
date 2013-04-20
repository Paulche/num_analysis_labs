function [R m_straight_y] = action()
  [x y] = linput();

  delete(findall(0,'Type','Figure'));

  % First part
  [simple_y simple_x simple_rev_y simple_rev_x] = simple_square();

  subplot(3,2,1);
  plot(x(1:10),y(1:10),'b.');
  hold on;

  plot(simple_x,simple_y,'r');
  plot(simple_rev_y,simple_rev_x,'g');

  legend('Exact','Direct','Reverse');
  hold off;

  simple_mean       = mean(simple_y)
  simple_median     = median(simple_y)

  simple_std        = std(simple_y)
  simple_std_s      = std(simple_y, 1)

  corr              = corrcoef(simple_y)

  % Second part
  draw_poly(3,1)
  draw_poly(5,2)
  R = draw_poly(7,3)

  % Third part
  straight_p = polyfit(x,y,7);
  reverse_p = polyfit(y,x,7);

  m_straight_y = mapprox(x,straight_p)

  subplot(3,2,5);
  plot(x,y,'r.',x,m_straight_y,'b');
  legend('Variable', 'Straight');
end
