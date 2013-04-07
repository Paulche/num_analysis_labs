function draw_poly(n,pos)
  [x y] = linput();

  straight_x = x;
  straight_y = poly(x,y,n);

  reverse_x = poly(y,x,n);
  reverse_y = y

  % Draw plots
  subplot(3,2,2*pos);
  plot_x = [x; straight_x; reverse_x]';
  plot_y = [y; straight_y; reverse_y]';
  plot(plot_x,plot_y);
  legend(sprintf('Variable %d',n), 'Straight', 'Reverse');
end
